# transform the aligned text output of aws s3 ls into something useful
# presumes you have the aws CLI
aws s3 ls s3://your-bucket-and-path | lines | each { str replace '  ' ' ' | str replace '  ' ' ' } | split column ' '
