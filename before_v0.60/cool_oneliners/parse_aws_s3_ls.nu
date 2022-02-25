# transform the aligned text output of aws s3 ls into something useful
# presumes you have the aws CLI
aws s3 ls s3://your-bucket-and-path | lines | each { echo $it | str find-replace '  ' ' ' | str find-replace '  ' ' ' } | split column ' '
