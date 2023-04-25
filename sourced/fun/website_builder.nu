# Converts markdown into their equivalent html pages
let $markdown_files = (ls **/*.md)

for $markdown in $markdown_files {
    let $contents = (open --raw $markdown.name)

    let $content_lines = ($contents | lines)

    let $first_line = ($content_lines | first | str trim)

    if $first_line == "---" {
        let $header = ($content_lines
                       | skip 1
                       | take while {|x| ($x | str trim) != "---"}
                       | str join "\n"
                       | from yaml)

        let $post = ($content_lines
                     | skip 1
                     | skip while {|x| ($x | str trim) != "---"}
                     | skip 1)

        print $header

        let $html_post = ($post
                          | each {|line|
                              if ($line | str starts-with "#") {
                                let $line = ($line | str replace "^# (.*)$" "<h1>$1</h1>")
                                let $line = ($line | str replace "^## (.*)$" "<h2>$1</h2>")
                                let $line = ($line | str replace "^### (.*)$" "<h3>$1</h3>")

                                $line
                              } else if $line != "" {
                                # Otherwise, it's a paragraph
                                # Convert images
                                let $line = ($line | str replace --all '!\[(.+)\]\((.+)\)' '<img src="$2" alt="$1"/>')
                                let $line = ($line | str replace --all 'src="../assets' 'src="assets')

                                # Convert links
                                let $line = ($line | str replace --all '\[(.+?)\]\((.+?)\)' '<a href="$2">$1</a>')

                                # Convert code
                                let $line = ($line | str replace --all '`(.+?)`' '<code>$1</code>')
                                $"<p>($line)</p>"
                              }
                          })

        let $html_post = ($html_post | str join "\n")
        let $html_post = $"<!DOCTYPE html>
        <html>
          <head>
            <meta charset="utf-8">
            <title>($header.title)</title>
            <style>
              img {
                  max-width: 600px
              }
              p {
                display: block;
                margin-block-start: 1em;
                margin-block-end: 1em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
              }
              body {
                font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;
                -webkit-font-smoothing: antialiased;
                font-size: 16px;
                color: #2c3e50;
                line-height: 1.7;
                max-width: 740px;
                margin: 0 auto;
                padding: 2rem 2.5rem;
              }
              code {
                color: #476582;
                padding: .25rem .5rem;
                margin: 0;
                font-size: .85em;
                background-color: #eeeeee;
                border-radius: 3px;
              }
            </style>
          </head>
          <body>
            ($html_post)
          </body>
        </html>"

        # print $html_post

        let $name = ($markdown.name | path parse | update extension "html" | path join)

        $html_post | save --raw $name
    }
}
