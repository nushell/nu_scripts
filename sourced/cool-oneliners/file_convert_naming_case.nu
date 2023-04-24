# rename any SQL files in current directory from hello_file.sql to hello-file.sql
ls ./*.sql | each { |f|
			let ext = (echo $f.name | path parse  | get extension);
			let cur_stem = (echo $f.name | path parse  | get stem);
			let new_name = (build-string (echo $cur_stem | str kebab-case) "." $ext)
			mv $f.name $new_name
}
