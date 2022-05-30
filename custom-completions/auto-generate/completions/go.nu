# force rebuild
extern "go" [

	...args
]

# compile packages and dependencies
extern "go build" [

	...args
]

# remove object files
extern "go clean" [

	...args
]

# run godoc on package sources
extern "go doc" [

	...args
]

# print Go environment information
extern "go env" [

	...args
]

# run go tool fix on packages
extern "go fix" [

	...args
]

# run gofmt on package sources
extern "go fmt" [

	...args
]

# download and install packages and dependencies
extern "go get" [

	...args
]

# Generate runs commands described by directives within existing files.
extern "go generate" [

	...args
]

# get help on topic
extern "go help" [

	...args
]

# compile and install packages and dependencies
extern "go install" [

	...args
]

# list packages
extern "go list" [

	...args
]

# compile and run Go program
extern "go run" [

	...args
]

# test packages
extern "go test" [

	...args
]

# run specified go tool
extern "go tool" [

	...args
]

# target tool
extern "go addr2line api asm cgo compile dist fix link nm objdump pack pprof prof vet yacc" [

	...args
]

# print Go version
extern "go version" [

	...args
]

# vet packages
extern "go vet" [

	...args
]

# module maintenance
extern "go mod" [

	...args
]

# download modules to local cache
extern "go download" [

	...args
]

# edit go.mod from tools or scripts
extern "go edit" [

	...args
]

# print module requirement graph
extern "go graph" [

	...args
]

# initialize new module in current directory
extern "go init" [

	...args
]

# add missing and remove unused modules
extern "go tidy" [

	...args
]

# make vendored copy of dependencies
extern "go vendor" [

	...args
]

# verify dependencies have expected content
extern "go verify" [

	...args
]

# explain why packages or modules are needed
extern "go why" [

	...args
]