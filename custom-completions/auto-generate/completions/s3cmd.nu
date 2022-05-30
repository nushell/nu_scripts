# 
extern "s3cmd" [

	...args
]

# Make bucket
extern "s3cmd mb" [

	...args
]

# Remove bucket
extern "s3cmd rb" [

	...args
]

# List objects or buckets
extern "s3cmd ls" [
	--limit					# Max objects per response
	--list-md5					# Include MD5 sums in bucket listings
	--long-listing(-l)					# Produce long listing
	...args
]

# List all object in all buckets
extern "s3cmd la" [
	--limit					# Max objects per response
	...args
]

# Put file into bucket
extern "s3cmd put" [
	--rr					# Store with reduced redundancy
	--no-rr					# Store without reduced redundancy
	...args
]

# Get file from bucket
extern "s3cmd get" [
	--continue					# Resume partially downloaded file
	--skip-existing					# Skip existing files at destination
	--delete-after-fetch					# Delete remotely after fetch
	...args
]

# Delete file from bucket
extern "s3cmd del" [
	--max-delete					# Delete no more than NUM files
	...args
]

# Delete file from bucket (alias for del)
extern "s3cmd rm" [

	...args
]

# Restore file from Glacier storage
extern "s3cmd restore" [

	...args
]

# Synchronize a directory tree to S3
extern "s3cmd sync" [
	--skip-existing					# Skip existing files at destination
	--check-md5					# Check MD5 sums (default)
	--no-check-md5					# Skip MD5 sum check
	--delete-removed					# Delete objects not found locally
	--delete-after					# Delete after upload
	--max-delete					# Delete no more than NUM files
	--delete-after-fetch					# Delete remotely after fetch
	...args
]

# Disk usage by buckets
extern "s3cmd du" [

	...args
]

# Get various information about Buckets or Files
extern "s3cmd info" [

	...args
]

# Copy object
extern "s3cmd cp" [
	--rr					# Store with reduced redundancy
	--no-rr					# Store without reduced redundancy
	...args
]

# Modify object metadata
extern "s3cmd modify" [
	--access-logging-target-prefix					# Prefix for access logs
	--no-access-logging					# Disable access logging
	--enable					# Enable CloudFront distribution
	--disable					# Disable CloudFront distribution
	--cf-invalidate					# Invalidate CloudFront file
	--cf-invalidate-default-index					# Invalidate default index
	--cf-no-invalidate-default-index-root					# Dont invalidate default index
	--cf-add-cname					# Add CNAME to CloudFront distribution
	--cf-remove-cname					# Remove CNAME from CloudFront distribution
	--cf-comment					# Set COMMENT for CloudFront distribution
	--cf-default-root-object					# Set default root object
	...args
]

# Move object
extern "s3cmd mv" [
	--rr					# Store with reduced redundancy
	--no-rr					# Store without reduced redundancy
	...args
]

# Modify Access control list for Bucket or Files
extern "s3cmd setacl" [

	...args
]

# Modify Bucket Policy
extern "s3cmd setpolicy" [

	...args
]

# Delete Bucket Policy
extern "s3cmd delpolicy" [

	...args
]

# Modify Bucket CORS
extern "s3cmd setcors" [

	...args
]

# Delete Bucket CORS
extern "s3cmd delcors" [

	...args
]

# Modify Bucket Requester Pays policy
extern "s3cmd payer" [

	...args
]

# Show multipart uploads
extern "s3cmd multipart" [

	...args
]

# Abort a multipart upload
extern "s3cmd abortmp" [

	...args
]

# List parts of a multipart upload
extern "s3cmd listmp" [

	...args
]

# Enable/disable bucket access logging
extern "s3cmd accesslog" [
	--access-logging-target-prefix					# Prefix for access logs
	--no-access-logging					# Disable access logging
	...args
]

# Sign arbitrary string using the secret key
extern "s3cmd sign" [

	...args
]

# Sign an S3 URL to provide limited public access with expiry
extern "s3cmd signurl" [

	...args
]

# Fix invalid file names in a bucket
extern "s3cmd fixbucket" [

	...args
]

# Create Website from bucket
extern "s3cmd ws-create" [
	--ws-index					# Name of index-document
	--ws-error					# Name of error-document
	...args
]

# Delete Website
extern "s3cmd ws-delete" [

	...args
]

# Info about Website
extern "s3cmd ws-info" [

	...args
]

# Set or delete expiration rule for the bucket
extern "s3cmd expire" [
	--expiry-date					# When expiration rule takes effect
	--expiry-days					# Days to expire
	--expiry-prefix					# Apply expiry to objects matching prefix
	...args
]

# Upload a lifecycle policy for the bucket
extern "s3cmd setlifecycle" [

	...args
]

# Remove a lifecycle policy for the bucket
extern "s3cmd dellifecycle" [

	...args
]

# List CloudFront distribution points
extern "s3cmd cflist" [

	...args
]

# Display CloudFront distribution point parameters
extern "s3cmd cfinfo" [

	...args
]

# Create CloudFront distribution point
extern "s3cmd cfcreate" [
	--cf-add-cname					# Add CNAME to CloudFront distribution
	--cf-comment					# Set COMMENT for CloudFront distribution
	--cf-default-root-object					# Set default root object
	...args
]

# Delete CloudFront distribution point
extern "s3cmd cfdelete" [

	...args
]

# Change CloudFront distribution point parameters
extern "s3cmd cfmodify" [
	--access-logging-target-prefix					# Prefix for access logs
	--no-access-logging					# Disable access logging
	--enable					# Enable CloudFront distribution
	--disable					# Disable CloudFront distribution
	--cf-invalidate					# Invalidate CloudFront file
	--cf-invalidate-default-index					# Invalidate default index
	--cf-no-invalidate-default-index-root					# Dont invalidate default index
	--cf-add-cname					# Add CNAME to CloudFront distribution
	--cf-remove-cname					# Remove CNAME from CloudFront distribution
	--cf-comment					# Set COMMENT for CloudFront distribution
	--cf-default-root-object					# Set default root object
	...args
]

# Display CloudFront invalidation request(s) status
extern "s3cmd cfinvalinfo" [

	...args
]