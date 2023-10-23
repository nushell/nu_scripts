# Examples
#     redirect to the null stream
#     > echo foo out> (null-stream)
def null-stream []: nothing -> string {
    if $nu.os-info.name  == "windows" {
        "NUL:"
    } else {
        "/dev/null"
    }
}
