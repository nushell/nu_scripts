# nu-version: 0.116.1

# Completions for gh (generated from `gh help reference`, gh 2.104.0) and
# your gh aliases. One `gh` extern with no declared flags hands the whole command line to
# `nu-complete gh`, so every argument reaches gh exactly as typed (`--draft=false`,
# `-f body='Hi there'`, `-L5`). Command and flag data are tab-separated rows, decoded only
# for the command being completed.

# command path, positional kinds, description
const GH_COMMANDS = r#'
	gh-command	Work seamlessly with GitHub from the command line
agent-task		Work with agent tasks (preview)
agent-task create		Create an agent task (preview)
agent-task list		List agent tasks (preview)
agent-task view	pr	View an agent task session (preview)
alias		Create command shortcuts
alias delete	alias	Delete set aliases
alias import	file	Import aliases from a YAML file
alias list		List your aliases
alias set		Create a shortcut for a gh command
api	api-endpoint	Make an authenticated GitHub API request
attestation		Work with artifact attestations
attestation download	file	Download an artifact's attestations for offline use
attestation trusted-root		Output trusted_root.jsonl contents, likely for offline verification
attestation verify	file	Verify an artifact's integrity using attestations
auth		Authenticate gh and git with GitHub
auth login		Log in to a GitHub account
auth logout		Log out of a GitHub account
auth refresh		Refresh stored authentication credentials
auth setup-git		Setup git with GitHub CLI
auth status		Display active account and authentication state on each known GitHub host
auth switch		Switch active GitHub account
auth token		Print the authentication token gh uses for a hostname and account
browse	file	Open repositories, issues, pull requests, and more in the browser
cache		Manage GitHub Actions caches
cache delete	cache	Delete GitHub Actions caches
cache list		List GitHub Actions caches
codespace		Connect to and manage codespaces
codespace code		Open a codespace in Visual Studio Code
codespace cp	file...	Copy files between local and remote file systems
codespace create		Create a codespace
codespace delete		Delete codespaces
codespace edit		Edit a codespace
codespace jupyter		Open a codespace in JupyterLab
codespace list		List codespaces
codespace logs		Access codespace logs
codespace ports		List ports in a codespace
codespace ports forward		Forward ports
codespace ports visibility		Change the visibility of the forwarded port
codespace rebuild		Rebuild a codespace
codespace ssh		SSH into a codespace
codespace stop		Stop a running codespace
codespace view		View details about a codespace
completion		Generate shell completion scripts
config		Manage configuration for gh
config clear-cache		Clear the cli cache
config get	config-key	Print the value of a given configuration key
config list		Print a list of configuration keys and values
config set	config-key config-value	Update configuration with a value for the given key
copilot		Run the GitHub Copilot CLI (preview)
discussion		Work with GitHub Discussions (preview)
discussion comment	discussion	Add, edit, or delete a comment or a reply on a discussion (preview)
discussion create		Create a new discussion (preview)
discussion edit	discussion	Edit a discussion (preview)
discussion list		List discussions in a repository (preview)
discussion view	discussion	View a discussion (preview)
extension		Manage gh extensions
extension browse		Enter a UI for browsing, adding, and removing extensions
extension create		Create a new extension
extension exec	extension none...	Execute an installed extension
extension install		Install a gh extension from a repository
extension list		List installed extension commands
extension remove	extension	Remove an installed extension
extension search		Search extensions to the GitHub CLI
extension upgrade	extension	Upgrade installed extensions
gist		Manage gists
gist clone	gist file	Clone a gist locally
gist create	file...	Create a new gist
gist delete	gist	Delete a gist
gist edit	gist gist-file	Edit one of your gists
gist list		List your gists
gist rename	gist gist-file	Rename a file in a gist
gist view	gist	View a gist
gpg-key		Manage GPG keys
gpg-key add	file	Add a GPG key to your GitHub account
gpg-key delete	gpg-key	Delete a GPG key from your GitHub account
gpg-key list		Lists GPG keys in your GitHub account
issue		Manage issues
issue artifact		Work with issue artifacts (preview)
issue artifact create	issue file...	Create issue artifacts (preview)
issue artifact delete	issue	Delete issue artifacts (preview)
issue artifact download	issue	Download issue artifacts (preview)
issue artifact edit	issue	Edit an issue artifact (preview)
issue artifact list	issue	List artifacts on an issue (preview)
issue artifact view	issue	View an issue artifact (preview)
issue close	issue	Close issue
issue comment	issue	Add a comment to an issue
issue create		Create a new issue
issue delete	issue	Delete issue
issue develop	issue	Manage linked branches for an issue
issue edit	issue...	Edit issues
issue list		List issues in a repository
issue lock	issue	Lock issue conversation
issue pin	issue	Pin an issue
issue reopen	issue-closed	Reopen issue
issue status		Show status of relevant issues
issue transfer	issue repo	Transfer issue to another repository
issue unlock	issue	Unlock issue conversation
issue unpin	issue	Unpin an issue
issue view	issue	View an issue
label		Manage labels
label clone	repo	Clones labels from one repository to another
label create		Create a new label
label delete	label	Delete a label from a repository
label edit	label	Edit a label
label list		List labels in a repository
licenses		View third-party license information
org		Manage organizations
org list		List organizations for the authenticated user.
pr		Manage pull requests
pr checkout	pr	Check out a pull request in git
pr checks	pr	Show CI status for a single pull request
pr close	pr	Close a pull request
pr comment	pr	Add a comment to a pull request
pr create		Create a pull request
pr diff	pr	View changes in a pull request
pr edit	pr	Edit a pull request
pr list		List pull requests in a repository
pr lock	pr	Lock pull request conversation
pr merge	pr	Merge a pull request
pr ready	pr	Mark a pull request as ready for review
pr reopen	pr-closed	Reopen a pull request
pr revert	pr-merged	Revert a pull request
pr review	pr	Add a review to a pull request
pr status		Show status of relevant pull requests
pr unlock	pr	Unlock pull request conversation
pr update-branch	pr	Update a pull request branch
pr view	pr	View a pull request
preview		Execute previews for gh features
preview prompter	prompt-type	Execute a test program to preview the prompter
project		Work with GitHub Projects.
project close	project	Close a project
project copy	project	Copy a project
project create		Create a project
project delete	project	Delete a project
project edit	project	Edit a project
project field-create	project	Create a field in a project
project field-delete		Delete a field in a project
project field-list	project	List the fields in a project
project item-add	project	Add a pull request or an issue to a project
project item-archive	project	Archive an item in a project
project item-create	project	Create a draft issue item in a project
project item-delete	project	Delete an item from a project by ID
project item-edit	project	Edit an item in a project
project item-list	project	List the items in a project
project link	project	Link a project to a repository or a team
project list		List the projects for an owner
project mark-template	project	Mark a project as a template
project unlink	project	Unlink a project from a repository or a team
project view	project	View a project
release		Manage releases
release create	none file...	Create a new release
release delete	release	Delete a release
release delete-asset	release release-asset	Delete an asset from a release
release download	release	Download release assets
release edit	release	Edit a release
release list		List releases in a repository
release upload	release file...	Upload assets to a release
release verify	release	Verify the attestation for a release
release verify-asset	release file	Verify that a given asset originated from a release
release view	release	View information about a release
repo		Manage repositories
repo archive	repo	Archive a repository
repo autolink		Manage autolink references
repo autolink create		Create a new autolink reference
repo autolink delete	autolink	Delete an autolink reference
repo autolink list		List autolink references for a GitHub repository
repo autolink view	autolink	View an autolink reference
repo clone	repo file	Clone a repository locally
repo create		Create a new repository
repo delete	repo	Delete a repository
repo deploy-key		Manage deploy keys in a repository
repo deploy-key add	file	Add a deploy key to a GitHub repository
repo deploy-key delete	deploy-key	Delete a deploy key from a GitHub repository
repo deploy-key list		List deploy keys in a GitHub repository
repo edit	repo	Edit repository settings
repo fork	repo	Create a fork of a repository
repo gitignore		List and view available repository gitignore templates
repo gitignore list		List available repository gitignore templates
repo gitignore view	gitignore	View an available repository gitignore template
repo license		Explore repository licenses
repo license list		List common repository licenses
repo license view	license	View a specific repository license
repo list	owner	List repositories owned by user or organization
repo read-dir		List a directory in a repository (preview)
repo read-file		Read a file from a repository (preview)
repo rename		Rename a repository
repo set-default	repo	Configure default repository for this directory
repo sync	repo	Sync a repository
repo unarchive	repo	Unarchive a repository
repo view	repo	View a repository
ruleset		View info about repo rulesets
ruleset check	branch	View rules that would apply to a given branch
ruleset list		List rulesets for a repository or organization
ruleset view	ruleset	View information about a ruleset
run		View details about workflow runs
run cancel	run	Cancel a workflow run
run delete	run	Delete a workflow run
run download	run	Download artifacts generated by a workflow run
run list		List recent workflow runs
run rerun	run	Rerun a run
run view	run	View a summary of a workflow run
run watch	run	Watch a run until it completes, showing its progress
search		Search for repositories, issues, and pull requests
search code		Search within code
search commits		Search for commits
search issues		Search for issues
search prs		Search for pull requests
search repos		Search for repositories
secret		Manage GitHub secrets
secret delete	secret	Delete secrets
secret list		List secrets
secret set	secret	Create or update secrets
skill		Install and manage agent skills (preview)
skill install		Install agent skills from a GitHub repository (preview)
skill list		List installed skills (preview)
skill preview		Preview a skill from a GitHub repository (preview)
skill publish	file	Validate and publish skills to a GitHub repository (preview)
skill search		Search for skills across GitHub (preview)
skill update	skill...	Update installed skills to their latest versions (preview)
ssh-key		Manage SSH keys
ssh-key add	file	Add an SSH key to your GitHub account
ssh-key delete	ssh-key	Delete an SSH key from your GitHub account
ssh-key list		Lists SSH keys in your GitHub account
status		Print information about relevant issues, pull requests, and notifications across repositories
variable		Manage GitHub Actions variables
variable delete	variable	Delete variables
variable get	variable	Get variables
variable list		List variables
variable set	variable	Create or update variables
workflow		View details about GitHub Actions workflows
workflow disable	workflow	Disable a workflow
workflow enable	workflow	Enable a workflow
workflow list		List workflows
workflow run	workflow	Run a workflow by creating a workflow_dispatch event
workflow view	workflow	View the summary of a workflow
help	help-topic help-subcommand	Help about any command or topic
'#

# command path, long flag, short flag, b(ool)|v(alue)|i(nt)|f(ile), completer or =values, description
const GH_FLAGS = r#'
	version		b		Show gh version
agent-task create	base	b	v	branches	Base branch for the pull request (use default branch if not provided)
agent-task create	custom-agent	a	v		Use a custom agent for the task. e.g., use 'my-agent' for the 'my-agent.md' agent
agent-task create	follow		b		Follow agent session logs
agent-task create	from-file	F	f		Read task description from file (use "-" to read from standard input)
agent-task create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
agent-task list	jq	q	v		Filter JSON output using a jq expression
agent-task list	json		v	json-fields	Output JSON with the specified fields
agent-task list	limit	L	i		Maximum number of agent tasks to fetch (default 30)
agent-task list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
agent-task list	web	w	b		Open agent tasks in the browser
agent-task view	follow		b		Follow agent session logs
agent-task view	jq	q	v		Filter JSON output using a jq expression
agent-task view	json		v	json-fields	Output JSON with the specified fields
agent-task view	log		b		Show agent session logs
agent-task view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
agent-task view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
agent-task view	web	w	b		Open agent task in the browser
alias delete	all		b		Delete all aliases
alias import	clobber		b		Overwrite existing aliases of the same name
alias set	clobber		b		Overwrite existing aliases of the same name
alias set	shell	s	b		Declare an alias to be passed through a shell interpreter
api	allow-escape-sequences		b		Allow printing terminal escape sequences
api	cache		v		Cache the response, e.g. "3600s", "60m", "1h"
api	field	F	v		Add a typed parameter in key=value format (use "@<path>" or "@-" to read value from file or stdin)
api	header	H	v	api-headers	Add a HTTP request header in key:value format
api	hostname		v	hosts	The GitHub hostname for the request (default "github.com")
api	include	i	b		Include HTTP response status line and headers in the output
api	input		f		The file to use as body for the HTTP request (use "-" to read from standard input)
api	jq	q	v		Query to select values from the response using jq syntax
api	method	X	v	http-methods	The HTTP method for the request (default "GET")
api	paginate		b		Make additional HTTP requests to fetch all pages of results
api	preview	p	v		Opt into GitHub API previews (names should omit '-preview')
api	raw-field	f	v		Add a string parameter in key=value format
api	silent		b		Do not print the response body
api	slurp		b		Use with "--paginate" to return an array of all pages of either JSON arrays or objects
api	template	t	v		Format JSON output using a Go template; see "gh help formatting"
api	verbose		b		Include full HTTP request and response in the output
attestation download	digest-alg	d	v	=sha256|sha512	The algorithm used to compute a digest of the artifact: {sha256|sha512} (default "sha256")
attestation download	hostname		v	hosts	Configure host to use
attestation download	limit	L	i		Maximum number of attestations to fetch (default 30)
attestation download	owner	o	v	owners	GitHub organization to scope attestation lookup by
attestation download	predicate-type		v		Filter attestations by provided predicate type
attestation download	repo	R	v	repos	Repository name in the format <owner>/<repo>
attestation trusted-root	hostname		v	hosts	Configure host to use
attestation trusted-root	tuf-root		v		Path to the TUF root.json file on disk
attestation trusted-root	tuf-url		v		URL to the TUF repository mirror
attestation trusted-root	verify-only		b		Don't output trusted_root.jsonl contents
attestation verify	bundle	b	v		Path to bundle on disk, either a single bundle in a JSON file or a JSON lines file with multiple bundles
attestation verify	bundle-from-oci		b		When verifying an OCI image, fetch the attestation bundle from the OCI registry instead of from GitHub
attestation verify	cert-identity		v		Enforce that the certificate's SubjectAlternativeName matches the provided value exactly
attestation verify	cert-identity-regex	i	v		Enforce that the certificate's SubjectAlternativeName matches the provided regex
attestation verify	cert-oidc-issuer		v		Enforce that the issuer of the OIDC token matches the provided value (default "https://token.actions.githubusercontent.com")
attestation verify	custom-trusted-root		v		Path to a trusted_root.jsonl file; likely for offline verification
attestation verify	deny-self-hosted-runners		b		Fail verification for attestations generated on self-hosted runners
attestation verify	digest-alg	d	v	=sha256|sha512	The algorithm used to compute a digest of the artifact: {sha256|sha512} (default "sha256")
attestation verify	format		v	=json	Output format: {json}
attestation verify	hostname		v	hosts	Configure host to use
attestation verify	jq	q	v		Filter JSON output using a jq expression
attestation verify	limit	L	i		Maximum number of attestations to fetch (default 30)
attestation verify	no-public-good		b		Do not verify attestations signed with Sigstore public good instance
attestation verify	owner	o	v	owners	GitHub organization to scope attestation lookup by
attestation verify	predicate-type		v		Enforce that verified attestations' predicate type matches the provided value (default "https://slsa.dev/provenance/v1")
attestation verify	repo	R	v	repos	Repository name in the format <owner>/<repo>
attestation verify	signer-digest		v		Enforce that the digest associated with the signer workflow matches the provided value
attestation verify	signer-repo		v	repos	Enforce that the workflow that signed the attestation's repository matches the provided value (<owner>/<repo>)
attestation verify	signer-workflow		v		Enforce that the workflow that signed the attestation matches the provided value ([host/]<owner>/<repo>/<path>/<to>/<workflow>)
attestation verify	source-digest		v		Enforce that the digest associated with the source repository matches the provided value
attestation verify	source-ref		v		Enforce that the git ref associated with the source repository matches the provided value
attestation verify	template	t	v		Format JSON output using a Go template; see "gh help formatting"
auth login	clipboard	c	b		Copy one-time OAuth device code to clipboard
auth login	expiring		b		Prefer expiring credentials that gh refreshes automatically, if the host supports them
auth login	git-protocol	p	v	=ssh|https	The protocol to use for git operations on this host: {ssh|https}
auth login	hostname	h	v	hosts	The hostname of the GitHub instance to authenticate with
auth login	insecure-storage		b		Save authentication credentials in plain text instead of credential store
auth login	scopes	s	v	scopes	Additional authentication scopes to request
auth login	skip-ssh-key		b		Skip generate/upload SSH key prompt
auth login	web	w	b		Open a browser to authenticate
auth login	with-token		b		Read token from standard input
auth logout	hostname	h	v	hosts	The hostname of the GitHub instance to log out of
auth logout	user	u	v	accounts	The account to log out of
auth refresh	clipboard	c	b		Copy one-time OAuth device code to clipboard
auth refresh	expiring		b		Prefer expiring credentials that gh refreshes automatically, if the host supports them
auth refresh	hostname	h	v	hosts	The GitHub host to use for authentication
auth refresh	insecure-storage		b		Save authentication credentials in plain text instead of credential store
auth refresh	remove-scopes	r	v	scopes	Authentication scopes to remove from gh
auth refresh	reset-scopes		b		Reset authentication scopes to the default minimum set of scopes
auth refresh	scopes	s	v	scopes	Additional authentication scopes for gh to have
auth setup-git	force	f	b		Force setup even if the host is not known. Must be used in conjunction with --hostname
auth setup-git	hostname	h	v	hosts	The hostname to configure git for
auth status	active	a	b		Display the active account only
auth status	hostname	h	v	hosts	Check only a specific hostname's auth status
auth status	jq		v		Filter JSON output using a jq expression
auth status	json		v	json-fields	Output JSON with the specified fields
auth status	no-refresh		b		Do not automatically refresh expired tokens
auth status	show-token	t	b		Display the auth token
auth status	template		v		Format JSON output using a Go template; see "gh help formatting"
auth switch	hostname	h	v	hosts	The hostname of the GitHub instance to switch account for
auth switch	user	u	v	accounts	The account to switch to
auth token	hostname	h	v	hosts	The hostname of the GitHub instance authenticated with
auth token	no-refresh		b		Do not automatically refresh an expired token
auth token	user	u	v	accounts	The account to output the token for
browse	actions	a	b		Open repository actions
browse	blame		b		Open blame view for a file
browse	branch	b	v	branches	Select another branch by passing in the branch name
browse	commit	c	b		Select another commit by passing in the commit SHA, default is the last commit
browse	no-browser	n	b		Print destination URL instead of opening the browser
browse	projects	p	b		Open repository projects
browse	releases	r	b		Open repository releases
browse	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
browse	settings	s	b		Open repository settings
browse	wiki	w	b		Open repository wiki
cache	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
cache delete	all	a	b		Delete all caches, can be used with --ref to delete all caches for a specific ref
cache delete	ref	r	v	cache-refs	Delete by cache key and ref, formatted as refs/heads/<branch name> or refs/pull/<number>/merge
cache delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
cache delete	succeed-on-no-caches		b		Return exit code 0 if no caches found. Must be used in conjunction with --all
cache list	jq	q	v		Filter JSON output using a jq expression
cache list	json		v	json-fields	Output JSON with the specified fields
cache list	key	k	v		Filter by cache key prefix
cache list	limit	L	i		Maximum number of caches to fetch (default 30)
cache list	order	O	v	=asc|desc	Order of caches returned: {asc|desc} (default "desc")
cache list	ref	r	v	cache-refs	Filter by ref, formatted as refs/heads/<branch name> or refs/pull/<number>/merge
cache list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
cache list	sort	S	v	=created_at|last_accessed_at|size_in_bytes	Sort fetched caches: {created_at|last_accessed_at|size_in_bytes} (default "last_accessed_at")
cache list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
codespace code	codespace	c	v	codespaces	Name of the codespace
codespace code	insiders		b		Use the insiders version of Visual Studio Code
codespace code	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace code	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace code	web	w	b		Use the web version of Visual Studio Code
codespace cp	codespace	c	v	codespaces	Name of the codespace
codespace cp	expand	e	b		Expand remote file names on remote shell
codespace cp	profile	p	v		Name of the SSH profile to use
codespace cp	recursive	r	b		Recursively copy directories
codespace cp	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace cp	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace create	branch	b	v	branches	Repository branch
codespace create	default-permissions		b		Do not prompt to accept additional permissions requested by the codespace
codespace create	devcontainer-path		v		Path to the devcontainer.json file to use when creating codespace
codespace create	display-name	d	v		Display name for the codespace (48 characters or less)
codespace create	idle-timeout		v		Allowed inactivity before codespace is stopped, e.g. "10m", "1h"
codespace create	location	l	v	=EastUs|SouthEastAsia|WestEurope|WestUs2	Location: {EastUs|SouthEastAsia|WestEurope|WestUs2} (determined automatically if not provided)
codespace create	machine	m	v		Hardware specifications for the VM
codespace create	repo	R	v	repos	Repository name with owner: user/repo
codespace create	retention-period		v		Allowed time after shutting down before the codespace is automatically deleted (maximum 30 days), e.g. "1h", "72h"
codespace create	status	s	b		Show status of post-create command and dotfiles
codespace create	web	w	b		Create codespace from browser, cannot be used with --display-name, --idle-timeout, or --retention-period
codespace delete	all		b		Delete all codespaces
codespace delete	codespace	c	v	codespaces	Name of the codespace
codespace delete	days		i		Delete codespaces older than N days
codespace delete	force	f	b		Skip confirmation for codespaces that contain unsaved changes
codespace delete	org	o	v	orgs	The login handle of the organization (admin-only)
codespace delete	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace delete	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace delete	user	u	v		The username to delete codespaces for (used with --org)
codespace edit	codespace	c	v	codespaces	Name of the codespace
codespace edit	display-name	d	v		Set the display name
codespace edit	machine	m	v		Set hardware specifications for the VM
codespace edit	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace edit	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace jupyter	codespace	c	v	codespaces	Name of the codespace
codespace jupyter	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace jupyter	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace list	jq	q	v		Filter JSON output using a jq expression
codespace list	json		v	json-fields	Output JSON with the specified fields
codespace list	limit	L	i		Maximum number of codespaces to list (default 30)
codespace list	org	o	v	orgs	The login handle of the organization to list codespaces for (admin-only)
codespace list	repo	R	v	repos	Repository name with owner: user/repo
codespace list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
codespace list	user	u	v		The username to list codespaces for (used with --org)
codespace list	web	w	b		List codespaces in the web browser, cannot be used with --user or --org
codespace logs	codespace	c	v	codespaces	Name of the codespace
codespace logs	follow	f	b		Tail and follow the logs
codespace logs	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace logs	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace ports	codespace	c	v	codespaces	Name of the codespace
codespace ports	jq	q	v		Filter JSON output using a jq expression
codespace ports	json		v	json-fields	Output JSON with the specified fields
codespace ports	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace ports	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace ports	template	t	v		Format JSON output using a Go template; see "gh help formatting"
codespace ports forward	all-interfaces		b		Listen on all network interfaces
codespace ports forward	codespace	c	v	codespaces	Name of the codespace
codespace ports forward	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace ports forward	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace ports visibility	codespace	c	v	codespaces	Name of the codespace
codespace ports visibility	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace ports visibility	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace rebuild	codespace	c	v	codespaces	Name of the codespace
codespace rebuild	full		b		Perform a full rebuild
codespace rebuild	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace rebuild	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace ssh	codespace	c	v	codespaces	Name of the codespace
codespace ssh	config		b		Write OpenSSH configuration to stdout
codespace ssh	debug	d	b		Log debug data to a file
codespace ssh	debug-file		v		Path of the file log to
codespace ssh	profile		v		Name of the SSH profile to use
codespace ssh	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace ssh	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace ssh	server-port		i		SSH server port number (0 => pick unused)
codespace stop	codespace	c	v	codespaces	Name of the codespace
codespace stop	org	o	v	orgs	The login handle of the organization (admin-only)
codespace stop	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace stop	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace stop	user	u	v		The username to stop codespace for (used with --org)
codespace view	codespace	c	v	codespaces	Name of the codespace
codespace view	jq	q	v		Filter JSON output using a jq expression
codespace view	json		v	json-fields	Output JSON with the specified fields
codespace view	repo	R	v	repos	Filter codespace selection by repository name (user/repo)
codespace view	repo-owner		v	owners	Filter codespace selection by repository owner (username or org)
codespace view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
completion	shell	s	v	=bash|zsh|fish|powershell	Shell type: {bash|zsh|fish|powershell}
config get	host	h	v	hosts	Get per-host setting
config list	host	h	v	hosts	Get per-host configuration
config set	host	h	v	hosts	Set per-host setting
copilot	remove		b		Remove the downloaded Copilot CLI
discussion	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
discussion comment	body	b	v		Comment body text
discussion comment	body-file	F	v		Read body text from file (use "-" to read from standard input)
discussion comment	delete		b		Delete the specified comment
discussion comment	edit		b		Edit the specified comment
discussion comment	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
discussion comment	yes		b		Skip the delete confirmation prompt
discussion create	body	b	v		Body for the discussion
discussion create	body-file	F	v		Read body text from file (use "-" to read from stdin)
discussion create	category	c	v		Category name or slug for the discussion
discussion create	label	l	v	labels	Labels to apply to the discussion
discussion create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
discussion create	title	t	v		Title for the discussion
discussion edit	add-label		v	labels	Add labels by name
discussion edit	body	b	v		New body for the discussion
discussion edit	body-file	F	v		Read body text from file (use "-" to read from standard input)
discussion edit	category	c	v		New category name or slug for the discussion
discussion edit	remove-label		v	labels	Remove labels by name
discussion edit	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
discussion edit	title	t	v		New title for the discussion
discussion list	after		v		Cursor for the next page of results
discussion list	answered		b		Filter by answered state
discussion list	author	A	v	users	Filter by author
discussion list	category	c	v		Filter by category name or slug
discussion list	jq	q	v		Filter JSON output using a jq expression
discussion list	json		v	json-fields	Output JSON with the specified fields
discussion list	label	l	v	labels	Filter by label
discussion list	limit	L	i		Maximum number of discussions to fetch (default 30)
discussion list	order		v	=asc|desc	Order of results: {asc|desc} (default "desc")
discussion list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
discussion list	search	S	v		Search discussions with query
discussion list	sort		v	=created|updated	Sort by field: {created|updated} (default "updated")
discussion list	state	s	v	=open|closed|all	Filter by state: {open|closed|all} (default "open")
discussion list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
discussion list	web	w	b		List discussions in the web browser
discussion view	after		v		Cursor for the next page
discussion view	comments	c	b		View discussion comments
discussion view	jq	q	v		Filter JSON output using a jq expression
discussion view	json		v	json-fields	Output JSON with the specified fields
discussion view	limit	L	i		Maximum number of comments or replies to fetch (default 30)
discussion view	order		v	=oldest|newest	Order of comments or replies: {oldest|newest} (default "newest")
discussion view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
discussion view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
discussion view	web	w	b		Open a discussion in the browser
extension browse	debug		b		Log to /tmp/extBrowse-*
extension browse	single-column	s	b		Render TUI with only one column of text
extension create	precompiled		v	=go|other	Create a precompiled extension. Possible values: go, other
extension install	force		b		Force upgrade extension, or ignore if latest already installed
extension install	pin		v		Pin extension to a release tag or commit ref
extension search	jq	q	v		Filter JSON output using a jq expression
extension search	json		v	json-fields	Output JSON with the specified fields
extension search	license		v	licenses	Filter based on license type
extension search	limit	L	i		Maximum number of extensions to fetch (default 30)
extension search	order		v	=asc|desc	Order of repositories returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
extension search	owner		v	owners	Filter on owner
extension search	sort		v	=forks|help-wanted-issues|stars|updated	Sort fetched repositories: {forks|help-wanted-issues|stars|updated} (default "best-match")
extension search	template	t	v		Format JSON output using a Go template; see "gh help formatting"
extension search	web	w	b		Open the search query in the web browser
extension upgrade	all		b		Upgrade all extensions
extension upgrade	dry-run		b		Only display upgrades
extension upgrade	force		b		Force upgrade extension
gist create	desc	d	v		A description for this gist
gist create	filename	f	v		Provide a filename to be used when reading from standard input
gist create	public	p	b		List the gist publicly (default "secret")
gist create	web	w	b		Open the web browser with created gist
gist delete	yes		b		Confirm deletion without prompting
gist edit	add	a	v		Add a new file to the gist
gist edit	desc	d	v		New description for the gist
gist edit	filename	f	v	gist-files	Select a file to edit
gist edit	remove	r	v	gist-files	Remove a file from the gist
gist list	filter		v		Filter gists using a regular expression
gist list	include-content		b		Include gists' file content when filtering
gist list	limit	L	i		Maximum number of gists to fetch (default 10)
gist list	public		b		Show only public gists
gist list	secret		b		Show only secret gists
gist view	allow-escape-sequences		b		Allow printing terminal escape sequences
gist view	filename	f	v	gist-files	Display a single file from the gist
gist view	files		b		List file names from the gist
gist view	raw	r	b		Print raw instead of rendered gist contents
gist view	web	w	b		Open gist in the browser
gpg-key add	title	t	v		Title for the new key
gpg-key delete	yes	y	b		Skip the confirmation prompt
issue	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact create	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
issue artifact create	body	b	v		Content for a single document
issue artifact create	body-file	F	f		Read content for a single artifact from file (use "-" to read from standard input)
issue artifact create	name		v		Name for a single artifact
issue artifact create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact create	type		v	=generic|plan|embedded_html	Type for documents: {generic|plan|embedded_html}
issue artifact delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact delete	yes		b		Confirm deletion without prompting
issue artifact download	clobber		b		Overwrite existing files of the same name
issue artifact download	dir	D	f		The directory to download files into (default ".")
issue artifact download	output	O	f		The file to write a single artifact to (use "-" to write to standard output)
issue artifact download	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact download	skip-existing		b		Skip downloading when files of the same name exist
issue artifact download	version		v		Download the version with this number from the edit history
issue artifact edit	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
issue artifact edit	body	b	v		New content; for a link, a URL
issue artifact edit	body-file	F	f		Read new content from file (use "-" to read from standard input)
issue artifact edit	name		v		New name
issue artifact edit	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact edit	restore-version		v		Restore the version with this number from the edit history
issue artifact list	jq	q	v		Filter JSON output using a jq expression
issue artifact list	json		v	json-fields	Output JSON with the specified fields
issue artifact list	limit	L	i		Maximum number of artifacts to fetch
issue artifact list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
issue artifact list	type		v	=generic|plan|link|embedded_html	Filter by type: {generic|plan|link|embedded_html}
issue artifact view	jq	q	v		Filter JSON output using a jq expression
issue artifact view	json		v	json-fields	Output JSON with the specified fields
issue artifact view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue artifact view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
issue artifact view	version		v		Show the version with this number from the edit history
issue artifact view	web	w	b		Open a document's page on GitHub, or a link's URL
issue close	comment	c	v		Leave a closing comment
issue close	duplicate-of		v	issues	Mark as duplicate of another issue by number or URL
issue close	reason	r	v	close-reasons	Reason for closing: {completed|not planned|duplicate}
issue close	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue comment	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
issue comment	body	b	v		The comment body text
issue comment	body-file	F	f		Read body text from file (use "-" to read from standard input)
issue comment	create-if-none		b		Create a new comment if no comments are found. Can be used only with --edit-last
issue comment	delete-last		b		Delete the last comment of the current user
issue comment	edit-last		b		Edit the last comment of the current user
issue comment	editor	e	b		Skip prompts and open the text editor to write the body in
issue comment	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue comment	web	w	b		Open the web browser to write the comment
issue comment	yes		b		Skip the delete confirmation prompt when --delete-last is provided
issue create	assignee	a	v	users	Assign people by their login. Use "@me" to self-assign.
issue create	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
issue create	blocked-by		v	issues	Mark the new issue as blocked by these issue numbers or URLs
issue create	blocking		v	issues	Mark the new issue as blocking these issue numbers or URLs
issue create	body	b	v		Supply a body. Will prompt for one otherwise.
issue create	body-file	F	f		Read body text from file (use "-" to read from standard input)
issue create	editor	e	b		Skip prompts and open the text editor to write the title and body in. The first line is the title and the remaining text is the body.
issue create	label	l	v	labels	Add labels by name
issue create	milestone	m	v	milestones	Add the issue to a milestone by name
issue create	parent		v	issues	Add the new issue as a sub-issue of the specified parent number or URL
issue create	project	p	v	projects	Add the issue to projects by title
issue create	recover		v		Recover input from a failed run of create
issue create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue create	template	T	v	issue-templates	Template name to use as starting body text
issue create	title	t	v		Supply a title. Will prompt for one otherwise.
issue create	type		v		Set the issue type by name
issue create	web	w	b		Open the browser to create an issue
issue delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue delete	yes		b		Confirm deletion without prompting
issue develop	base	b	v	branches	Name of the remote branch you want to make your new branch from
issue develop	branch-repo		v	repos	Name or URL of the repository where you want to create your new branch
issue develop	checkout	c	b		Checkout the branch after creating it
issue develop	list	l	b		List linked branches for the issue
issue develop	name	n	v		Name of the branch to create
issue develop	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue develop	worktree		f		Check out the branch into a worktree at the given path
issue edit	add-assignee		v	users	Add assigned users by their login. Use "@me" to assign yourself, or "@copilot" to assign Copilot.
issue edit	add-blocked-by		v	issues	Add 'blocked by' relationships by issue number or URL
issue edit	add-blocking		v	issues	Add 'blocking' relationships by issue number or URL
issue edit	add-label		v	labels	Add labels by name
issue edit	add-project		v	projects	Add the issue to projects by title
issue edit	add-sub-issue		v	issues	Add sub-issues by number or URL
issue edit	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
issue edit	body	b	v		Set the new body.
issue edit	body-file	F	f		Read body text from file (use "-" to read from standard input)
issue edit	milestone	m	v	milestones	Edit the milestone the issue belongs to by name
issue edit	parent		v	issues	Set the parent issue by number or URL
issue edit	remove-assignee		v	users	Remove assigned users by their login. Use "@me" to unassign yourself, or "@copilot" to unassign Copilot.
issue edit	remove-blocked-by		v	issues	Remove 'blocked by' relationships by issue number or URL
issue edit	remove-blocking		v	issues	Remove 'blocking' relationships by issue number or URL
issue edit	remove-label		v	labels	Remove labels by name
issue edit	remove-milestone		b		Remove the milestone association from the issue
issue edit	remove-parent		b		Remove the parent issue
issue edit	remove-project		v	projects	Remove the issue from projects by title
issue edit	remove-sub-issue		v	issues	Remove sub-issues by number or URL
issue edit	remove-type		b		Remove the issue type from the issue
issue edit	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue edit	title	t	v		Set the new title.
issue edit	type		v		Set the issue type by name
issue list	app		v		Filter by GitHub App author
issue list	assignee	a	v	users	Filter by assignee
issue list	author	A	v	users	Filter by author (use --app to filter by a GitHub App)
issue list	jq	q	v		Filter JSON output using a jq expression
issue list	json		v	json-fields	Output JSON with the specified fields
issue list	label	l	v	labels	Filter by label
issue list	limit	L	i		Maximum number of issues to fetch (default 30)
issue list	mention		v	users	Filter by mention
issue list	milestone	m	v	milestones	Filter by milestone number or title
issue list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue list	search	S	v		Search issues with query
issue list	state	s	v	=open|closed|all	Filter by state: {open|closed|all} (default "open")
issue list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
issue list	type		v		Filter by issue type name
issue list	web	w	b		List issues in the web browser
issue lock	reason	r	v	lock-reasons	Optional reason for locking conversation (off_topic, resolved, spam, too_heated).
issue lock	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue pin	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue reopen	comment	c	v		Add a reopening comment
issue reopen	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue status	jq	q	v		Filter JSON output using a jq expression
issue status	json		v	json-fields	Output JSON with the specified fields
issue status	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue status	template	t	v		Format JSON output using a Go template; see "gh help formatting"
issue transfer	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue unlock	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue unpin	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue view	comments	c	b		View issue comments
issue view	jq	q	v		Filter JSON output using a jq expression
issue view	json		v	json-fields	Output JSON with the specified fields
issue view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
issue view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
issue view	web	w	b		Open an issue in the browser
label	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
label clone	force	f	b		Overwrite labels in the destination repository
label clone	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
label create	color	c	v		Color of the label
label create	description	d	v		Description of the label
label create	force	f	b		Update the label color and description if label already exists
label create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
label delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
label delete	yes		b		Confirm deletion without prompting
label edit	color	c	v		Color of the label
label edit	description	d	v		Description of the label
label edit	name	n	v		New name of the label
label edit	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
label list	jq	q	v		Filter JSON output using a jq expression
label list	json		v	json-fields	Output JSON with the specified fields
label list	limit	L	i		Maximum number of labels to fetch (default 30)
label list	order		v	=asc|desc	Order of labels returned: {asc|desc} (default "asc")
label list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
label list	search	S	v		Search label names and descriptions
label list	sort		v	=created|name	Sort fetched labels: {created|name} (default "created")
label list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
label list	web	w	b		List labels in the web browser
org list	limit	L	i		Maximum number of organizations to list (default 30)
pr	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr checkout	branch	b	v		Local branch name to use (default [the name of the head branch])
pr checkout	detach		b		Checkout PR with a detached HEAD
pr checkout	force	f	b		Reset the existing local branch to the latest state of the pull request
pr checkout	recurse-submodules		b		Update all submodules after checkout
pr checkout	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr checkout	worktree		f		Check out the pull request into a worktree at the given path
pr checks	fail-fast		b		Exit watch mode on first check failure
pr checks	interval	i	i		Refresh interval in seconds in watch mode (default 10)
pr checks	jq	q	v		Filter JSON output using a jq expression
pr checks	json		v	json-fields	Output JSON with the specified fields
pr checks	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr checks	required		b		Only show checks that are required
pr checks	template	t	v		Format JSON output using a Go template; see "gh help formatting"
pr checks	watch		b		Watch checks until they finish
pr checks	web	w	b		Open the web browser to show details about checks
pr close	comment	c	v		Leave a closing comment
pr close	delete-branch	d	b		Delete the local and remote branch after close
pr close	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr comment	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
pr comment	body	b	v		The comment body text
pr comment	body-file	F	f		Read body text from file (use "-" to read from standard input)
pr comment	create-if-none		b		Create a new comment if no comments are found. Can be used only with --edit-last
pr comment	delete-last		b		Delete the last comment of the current user
pr comment	edit-last		b		Edit the last comment of the current user
pr comment	editor	e	b		Skip prompts and open the text editor to write the body in
pr comment	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr comment	web	w	b		Open the web browser to write the comment
pr comment	yes		b		Skip the delete confirmation prompt when --delete-last is provided
pr create	assignee	a	v	users	Assign people by their login. Use "@me" to self-assign.
pr create	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
pr create	base	B	v	branches	The branch into which you want your code merged
pr create	body	b	v		Body for the pull request
pr create	body-file	F	f		Read body text from file (use "-" to read from standard input)
pr create	draft	d	b		Mark pull request as a draft
pr create	dry-run		b		Print details instead of creating the PR. May still push git changes.
pr create	editor	e	b		Skip prompts and open the text editor to write the title and body in. The first line is the title and the remaining text is the body.
pr create	fill	f	b		Use commit info for title and body
pr create	fill-first		b		Use first commit info for title and body
pr create	fill-verbose		b		Use commits msg+body for description
pr create	head	H	v	branches	The branch that contains commits for your pull request (default [current branch])
pr create	label	l	v	labels	Add labels by name
pr create	milestone	m	v	milestones	Add the pull request to a milestone by name
pr create	no-maintainer-edit		b		Disable maintainer's ability to modify pull request
pr create	project	p	v	projects	Add the pull request to projects by title
pr create	recover		v		Recover input from a failed run of create
pr create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr create	reviewer	r	v	users	Request reviews from people or teams by their handle
pr create	template	T	f		Template file to use as starting body text
pr create	title	t	v		Title for the pull request
pr create	web	w	b		Open the web browser to create a pull request
pr diff	allow-escape-sequences		b		Allow printing terminal escape sequences
pr diff	color		v	=always|never|auto	Use color in diff output: {always|never|auto} (default "auto")
pr diff	exclude	e	v		Exclude files matching glob patterns from the diff
pr diff	name-only		b		Display only names of changed files
pr diff	patch		b		Display diff in patch format
pr diff	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr diff	web	w	b		Open the pull request diff in the browser
pr edit	add-assignee		v	users	Add assigned users by their login. Use "@me" to assign yourself, or "@copilot" to assign Copilot.
pr edit	add-label		v	labels	Add labels by name
pr edit	add-project		v	projects	Add the pull request to projects by title
pr edit	add-reviewer		v	users	Add or re-request reviewers by their login. Use "@copilot" to request review from Copilot.
pr edit	attach		f		Attach an image or video file, in '<file>#<image alt text>' format
pr edit	base	B	v	branches	Change the base branch for this pull request
pr edit	body	b	v		Set the new body.
pr edit	body-file	F	f		Read body text from file (use "-" to read from standard input)
pr edit	milestone	m	v	milestones	Edit the milestone the pull request belongs to by name
pr edit	remove-assignee		v	users	Remove assigned users by their login. Use "@me" to unassign yourself, or "@copilot" to unassign Copilot.
pr edit	remove-label		v	labels	Remove labels by name
pr edit	remove-milestone		b		Remove the milestone association from the pull request
pr edit	remove-project		v	projects	Remove the pull request from projects by title
pr edit	remove-reviewer		v	users	Remove reviewers by their login. Use "@copilot" to remove review request from Copilot.
pr edit	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr edit	title	t	v		Set the new title.
pr list	app		v		Filter by GitHub App author
pr list	assignee	a	v	users	Filter by assignee
pr list	author	A	v	users	Filter by author (use --app to filter by a GitHub App)
pr list	base	B	v	branches	Filter by base branch
pr list	draft	d	b		Filter by draft state
pr list	head	H	v	branches	Filter by head branch ("<owner>:<branch>" syntax not supported)
pr list	jq	q	v		Filter JSON output using a jq expression
pr list	json		v	json-fields	Output JSON with the specified fields
pr list	label	l	v	labels	Filter by label
pr list	limit	L	i		Maximum number of items to fetch (default 30)
pr list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr list	search	S	v		Search pull requests with query
pr list	state	s	v	=open|closed|merged|all	Filter by state: {open|closed|merged|all} (default "open")
pr list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
pr list	web	w	b		List pull requests in the web browser
pr lock	reason	r	v	lock-reasons	Optional reason for locking conversation (off_topic, resolved, spam, too_heated).
pr lock	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr merge	admin		b		Use administrator privileges to merge a pull request that does not meet requirements
pr merge	author-email	A	v		Email text for merge commit author
pr merge	auto		b		Automatically merge only after necessary requirements are met
pr merge	body	b	v		Body text for the merge commit
pr merge	body-file	F	f		Read body text from file (use "-" to read from standard input)
pr merge	delete-branch	d	b		Delete the local and remote branch after merge
pr merge	disable-auto		b		Disable auto-merge for this pull request
pr merge	match-head-commit		v	commits	Commit SHA that the pull request head must match to allow merge
pr merge	merge	m	b		Merge the commits with the base branch
pr merge	rebase	r	b		Rebase the commits onto the base branch
pr merge	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr merge	squash	s	b		Squash the commits into one commit and merge it into the base branch
pr merge	subject	t	v		Subject text for the merge commit
pr ready	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr ready	undo		b		Convert a pull request to "draft"
pr reopen	comment	c	v		Add a reopening comment
pr reopen	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr revert	body	b	v		Body for the revert pull request
pr revert	body-file	F	f		Read body text from file (use "-" to read from standard input)
pr revert	draft	d	b		Mark revert pull request as a draft
pr revert	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr revert	title	t	v		Title for the revert pull request
pr review	approve	a	b		Approve pull request
pr review	body	b	v		Specify the body of a review
pr review	body-file	F	f		Read body text from file (use "-" to read from standard input)
pr review	comment	c	b		Comment on a pull request
pr review	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr review	request-changes	r	b		Request changes on a pull request
pr status	conflict-status	c	b		Display the merge conflict status of each pull request
pr status	jq	q	v		Filter JSON output using a jq expression
pr status	json		v	json-fields	Output JSON with the specified fields
pr status	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr status	template	t	v		Format JSON output using a Go template; see "gh help formatting"
pr unlock	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr update-branch	rebase		b		Update PR branch by rebasing on top of latest base branch
pr update-branch	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr view	comments	c	b		View pull request comments
pr view	jq	q	v		Filter JSON output using a jq expression
pr view	json		v	json-fields	Output JSON with the specified fields
pr view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
pr view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
pr view	web	w	b		Open a pull request in the browser
project close	format		v	=json	Output format: {json}
project close	jq	q	v		Filter JSON output using a jq expression
project close	owner		v	owners	Login of the owner. Use "@me" for the current user.
project close	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project close	undo		b		Reopen a closed project
project copy	drafts		b		Include draft issues when copying
project copy	format		v	=json	Output format: {json}
project copy	jq	q	v		Filter JSON output using a jq expression
project copy	source-owner		v	owners	Login of the source owner. Use "@me" for the current user.
project copy	target-owner		v	owners	Login of the target owner. Use "@me" for the current user.
project copy	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project copy	title		v		Title for the new project
project create	format		v	=json	Output format: {json}
project create	jq	q	v		Filter JSON output using a jq expression
project create	owner		v	owners	Login of the owner. Use "@me" for the current user.
project create	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project create	title		v		Title for the project
project delete	format		v	=json	Output format: {json}
project delete	jq	q	v		Filter JSON output using a jq expression
project delete	owner		v	owners	Login of the owner. Use "@me" for the current user.
project delete	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project edit	description	d	v		New description of the project
project edit	format		v	=json	Output format: {json}
project edit	jq	q	v		Filter JSON output using a jq expression
project edit	owner		v	owners	Login of the owner. Use "@me" for the current user.
project edit	readme		v		New readme for the project
project edit	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project edit	title		v		New title for the project
project edit	visibility		v	=PUBLIC|PRIVATE	Change project visibility: {PUBLIC|PRIVATE}
project field-create	data-type		v	=TEXT|SINGLE_SELECT|DATE|NUMBER	DataType of the new field.: {TEXT|SINGLE_SELECT|DATE|NUMBER}
project field-create	format		v	=json	Output format: {json}
project field-create	jq	q	v		Filter JSON output using a jq expression
project field-create	name		v		Name of the new field
project field-create	owner		v	owners	Login of the owner. Use "@me" for the current user.
project field-create	single-select-options		v		Options for SINGLE_SELECT data type
project field-create	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project field-delete	format		v	=json	Output format: {json}
project field-delete	id		v		ID of the field to delete
project field-delete	jq	q	v		Filter JSON output using a jq expression
project field-delete	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project field-list	format		v	=json	Output format: {json}
project field-list	jq	q	v		Filter JSON output using a jq expression
project field-list	limit	L	i		Maximum number of fields to fetch (default 30)
project field-list	owner		v	owners	Login of the owner. Use "@me" for the current user.
project field-list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project item-add	format		v	=json	Output format: {json}
project item-add	jq	q	v		Filter JSON output using a jq expression
project item-add	owner		v	owners	Login of the owner. Use "@me" for the current user.
project item-add	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project item-add	url		v		URL of the issue or pull request to add to the project
project item-archive	format		v	=json	Output format: {json}
project item-archive	id		v		ID of the item to archive
project item-archive	jq	q	v		Filter JSON output using a jq expression
project item-archive	owner		v	owners	Login of the owner. Use "@me" for the current user.
project item-archive	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project item-archive	undo		b		Unarchive an item
project item-create	body		v		Body for the draft issue
project item-create	format		v	=json	Output format: {json}
project item-create	jq	q	v		Filter JSON output using a jq expression
project item-create	owner		v	owners	Login of the owner. Use "@me" for the current user.
project item-create	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project item-create	title		v		Title for the draft issue
project item-delete	format		v	=json	Output format: {json}
project item-delete	id		v		ID of the item to delete
project item-delete	jq	q	v		Filter JSON output using a jq expression
project item-delete	owner		v	owners	Login of the owner. Use "@me" for the current user.
project item-delete	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project item-edit	body		v		Body of the draft issue item
project item-edit	clear		b		Remove field value
project item-edit	date		v		Date value for the field (YYYY-MM-DD)
project item-edit	field		v		Name of the field to update
project item-edit	field-id		v		ID of the field to update
project item-edit	format		v	=json	Output format: {json}
project item-edit	id		v		ID of the item to edit
project item-edit	iteration-id		v		ID of the iteration value to set on the field
project item-edit	jq	q	v		Filter JSON output using a jq expression
project item-edit	number		v		Number value for the field
project item-edit	owner		v	owners	Login of the owner. Use "@me" for the current user.
project item-edit	project-id		v		ID of the project to which the field belongs to
project item-edit	single-select-option-id		v		ID of the single select option value to set on the field
project item-edit	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project item-edit	text		v		Text value for the field
project item-edit	title		v		Title of the draft issue item
project item-edit	url		v		URL of the issue or pull request whose project item to edit
project item-edit	value		v		Value to set on the field named by --field
project item-list	field		v		Name of a field to show as an extra column
project item-list	field-id		v		ID of a field to show as an extra column
project item-list	format		v	=json	Output format: {json}
project item-list	jq	q	v		Filter JSON output using a jq expression
project item-list	limit	L	i		Maximum number of items to fetch (default 30)
project item-list	owner		v	owners	Login of the owner. Use "@me" for the current user
project item-list	query		v		Filter items using the Projects filter syntax, e.g. "assignee:octocat -status:Done"
project item-list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project link	owner		v	owners	Login of the owner. Use "@me" for the current user.
project link	repo	R	v	repos	The repository to be linked to this project
project link	team	T	v		The team to be linked to this project
project list	closed		b		Include closed projects
project list	format		v	=json	Output format: {json}
project list	jq	q	v		Filter JSON output using a jq expression
project list	limit	L	i		Maximum number of projects to fetch (default 30)
project list	owner		v	owners	Login of the owner
project list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project list	web	w	b		Open projects list in the browser
project mark-template	format		v	=json	Output format: {json}
project mark-template	jq	q	v		Filter JSON output using a jq expression
project mark-template	owner		v	owners	Login of the org owner.
project mark-template	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project mark-template	undo		b		Unmark the project as a template.
project unlink	owner		v	owners	Login of the owner. Use "@me" for the current user.
project unlink	repo	R	v	repos	The repository to be unlinked from this project
project unlink	team	T	v		The team to be unlinked from this project
project view	format		v	=json	Output format: {json}
project view	jq	q	v		Filter JSON output using a jq expression
project view	owner		v	owners	Login of the owner. Use "@me" for the current user.
project view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
project view	web	w	b		Open a project in the browser
release	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release create	discussion-category		v		Start a discussion in the specified category
release create	draft	d	b		Save the release as a draft instead of publishing it
release create	fail-on-no-commits		b		Fail if there are no commits since the last release (no impact on the first release)
release create	generate-notes		b		Automatically generate title and notes for the release via GitHub Release Notes API
release create	latest		b		Mark this release as "Latest" (default [automatic based on date and version]). --latest=false to explicitly NOT set as latest
release create	notes	n	v		Release notes
release create	notes-file	F	f		Read release notes from file (use "-" to read from standard input)
release create	notes-from-tag		b		Fetch notes from the tag annotation or message of commit associated with tag
release create	notes-start-tag		v	releases	Tag to use as the starting point for generating release notes
release create	prerelease	p	b		Mark the release as a prerelease
release create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release create	target		v	branches	Target branch or full commit SHA (default [main branch])
release create	title	t	v		Release title
release create	verify-tag		b		Abort in case the git tag doesn't already exist in the remote repository
release delete	cleanup-tag		b		Delete the specified tag in addition to its release
release delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release delete	yes	y	b		Skip the confirmation prompt
release delete-asset	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release delete-asset	yes	y	b		Skip the confirmation prompt
release download	allow-escape-sequences		b		Allow printing terminal escape sequences when writing an asset to standard output
release download	archive	A	v	archive-formats	Download the source code archive in the specified format (zip or tar.gz)
release download	clobber		b		Overwrite existing files of the same name
release download	dir	D	f		The directory to download files into (default ".")
release download	output	O	f		The file to write a single asset to (use "-" to write to standard output)
release download	pattern	p	v		Download only assets that match a glob pattern
release download	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release download	skip-existing		b		Skip downloading when files of the same name exist
release edit	discussion-category		v		Start a discussion in the specified category when publishing a draft
release edit	draft		b		Save the release as a draft instead of publishing it
release edit	latest		b		Explicitly mark the release as "Latest"
release edit	notes	n	v		Release notes
release edit	notes-file	F	f		Read release notes from file (use "-" to read from standard input)
release edit	prerelease		b		Mark the release as a prerelease
release edit	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release edit	tag		v		The name of the tag
release edit	target		v	branches	Target branch or full commit SHA (default [main branch])
release edit	title	t	v		Release title
release edit	verify-tag		b		Abort in case the git tag doesn't already exist in the remote repository
release list	exclude-drafts		b		Exclude draft releases
release list	exclude-pre-releases		b		Exclude pre-releases
release list	jq	q	v		Filter JSON output using a jq expression
release list	json		v	json-fields	Output JSON with the specified fields
release list	limit	L	i		Maximum number of items to fetch (default 30)
release list	order	O	v	=asc|desc	Order of releases returned: {asc|desc} (default "desc")
release list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
release upload	clobber		b		Delete and re-upload existing assets of the same name
release upload	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release verify	format		v	=json	Output format: {json}
release verify	jq	q	v		Filter JSON output using a jq expression
release verify	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release verify	template	t	v		Format JSON output using a Go template; see "gh help formatting"
release verify-asset	format		v	=json	Output format: {json}
release verify-asset	jq	q	v		Filter JSON output using a jq expression
release verify-asset	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release verify-asset	template	t	v		Format JSON output using a Go template; see "gh help formatting"
release view	jq	q	v		Filter JSON output using a jq expression
release view	json		v	json-fields	Output JSON with the specified fields
release view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
release view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
release view	web	w	b		Open the release in the browser
repo archive	yes	y	b		Skip the confirmation prompt
repo autolink	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo autolink create	numeric	n	b		Mark autolink as numeric
repo autolink create	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo autolink delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo autolink delete	yes		b		Confirm deletion without prompting
repo autolink list	jq	q	v		Filter JSON output using a jq expression
repo autolink list	json		v	json-fields	Output JSON with the specified fields
repo autolink list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo autolink list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo autolink list	web	w	b		List autolink references in the web browser
repo autolink view	jq	q	v		Filter JSON output using a jq expression
repo autolink view	json		v	json-fields	Output JSON with the specified fields
repo autolink view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo autolink view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo clone	no-upstream		b		Do not add an upstream remote when cloning a fork
repo clone	upstream-remote-name	u	v		Upstream remote name when cloning a fork (default "upstream")
repo create	add-readme		b		Add a README file to the new repository
repo create	clone	c	b		Clone the new repository to the current directory
repo create	description	d	v		Description of the repository
repo create	disable-issues		b		Disable issues in the new repository
repo create	disable-wiki		b		Disable wiki in the new repository
repo create	gitignore	g	v	gitignores	Specify a gitignore template for the repository
repo create	homepage	h	v		Repository home page URL
repo create	include-all-branches		b		Include all branches from template repository
repo create	internal		b		Make the new repository internal
repo create	license	l	v	licenses	Specify an Open Source License for the repository
repo create	private		b		Make the new repository private
repo create	public		b		Make the new repository public
repo create	push		b		Push local commits to the new repository
repo create	remote	r	v		Specify remote name for the new repository
repo create	source	s	v		Specify path to local repository to use as source
repo create	team	t	v		The name of the organization team to be granted access
repo create	template	p	v	repos	Make the new repository based on a template repository
repo delete	accept-cascading-deletion-of-private-forks		b		Accept that deleting a private repository also deletes its forks
repo delete	yes		b		Confirm deletion without prompting for confirmation
repo deploy-key	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo deploy-key add	allow-write	w	b		Allow write access for the key
repo deploy-key add	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo deploy-key add	title	t	v		Title of the new key
repo deploy-key delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo deploy-key list	jq	q	v		Filter JSON output using a jq expression
repo deploy-key list	json		v	json-fields	Output JSON with the specified fields
repo deploy-key list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo deploy-key list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo edit	accept-visibility-change-consequences		b		Accept the consequences of changing the repository visibility
repo edit	add-topic		v		Add repository topic
repo edit	allow-forking		b		Allow forking of an organization repository
repo edit	allow-update-branch		b		Allow a pull request head branch that is behind its base branch to be updated
repo edit	default-branch		v	branches	Set the default branch name for the repository
repo edit	delete-branch-on-merge		b		Delete head branch when pull requests are merged
repo edit	description	d	v		Description of the repository
repo edit	enable-advanced-security		b		Enable advanced security in the repository
repo edit	enable-auto-merge		b		Enable auto-merge functionality
repo edit	enable-discussions		b		Enable discussions in the repository
repo edit	enable-issues		b		Enable issues in the repository
repo edit	enable-merge-commit		b		Enable merging pull requests via merge commit
repo edit	enable-projects		b		Enable projects in the repository
repo edit	enable-rebase-merge		b		Enable merging pull requests via rebase
repo edit	enable-secret-scanning		b		Enable secret scanning in the repository
repo edit	enable-secret-scanning-push-protection		b		Enable secret scanning push protection in the repository. Secret scanning must be enabled first
repo edit	enable-squash-merge		b		Enable merging pull requests via squashed commit
repo edit	enable-wiki		b		Enable wiki in the repository
repo edit	homepage	h	v		Repository home page URL
repo edit	remove-topic		v	repo-topics	Remove repository topic
repo edit	squash-merge-commit-message		v	=default|pr-title|pr-title-commits|pr-title-description	The default value for a squash merge commit message: {default|pr-title|pr-title-commits|pr-title-description}
repo edit	template		b		Make the repository available as a template repository
repo edit	visibility		v	=public|private|internal	Change the visibility of the repository to {public,private,internal}
repo fork	clone		b		Clone the fork
repo fork	default-branch-only		b		Only include the default branch in the fork
repo fork	fork-name		v		Rename the forked repository
repo fork	org		v	orgs	Create the fork in an organization
repo fork	remote		b		Add a git remote for the fork
repo fork	remote-name		v		Specify the name for the new remote (default "origin")
repo license view	web	w	b		Open https://choosealicense.com/ in the browser
repo list	archived		b		Show only archived repositories
repo list	fork		b		Show only forks
repo list	jq	q	v		Filter JSON output using a jq expression
repo list	json		v	json-fields	Output JSON with the specified fields
repo list	language	l	v		Filter by primary coding language
repo list	limit	L	i		Maximum number of repositories to list (default 30)
repo list	no-archived		b		Omit archived repositories
repo list	source		b		Show only non-forks
repo list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo list	topic		v		Filter by topic
repo list	visibility		v	=public|private|internal	Filter by repository visibility: {public|private|internal}
repo read-dir	jq	q	v		Filter JSON output using a jq expression
repo read-dir	json		v	json-fields	Output JSON with the specified fields
repo read-dir	ref		v	branches	The branch, tag, or commit to list from
repo read-dir	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo read-dir	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo read-file	allow-escape-sequences		b		Allow printing terminal escape sequences
repo read-file	clobber		b		Overwrite the output path if it already exists
repo read-file	jq	q	v		Filter JSON output using a jq expression
repo read-file	json		v	json-fields	Output JSON with the specified fields
repo read-file	output	o	f		Write the file to a path instead of stdout
repo read-file	ref		v	branches	The branch, tag, or commit to read from
repo read-file	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo read-file	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo rename	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
repo rename	yes	y	b		Skip the confirmation prompt
repo set-default	unset	u	b		Unset the current default repository
repo set-default	view	v	b		View the current default repository
repo sync	branch	b	v	branches	Branch to sync (default [default branch])
repo sync	force		b		Hard reset the branch of the destination repository to match the source repository
repo sync	source	s	v	repos	Source repository
repo unarchive	yes	y	b		Skip the confirmation prompt
repo view	branch	b	v		View a specific branch of the repository
repo view	jq	q	v		Filter JSON output using a jq expression
repo view	json		v	json-fields	Output JSON with the specified fields
repo view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
repo view	web	w	b		Open a repository in the browser
ruleset	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
ruleset check	default		b		Check rules on default branch
ruleset check	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
ruleset check	web	w	b		Open the branch rules page in a web browser
ruleset list	limit	L	i		Maximum number of rulesets to list (default 30)
ruleset list	org	o	v	orgs	List organization-wide rulesets for the provided organization
ruleset list	parents	p	b		Whether to include rulesets configured at higher levels that also apply (default true)
ruleset list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
ruleset list	web	w	b		Open the list of rulesets in the web browser
ruleset view	org	o	v	orgs	Organization name if the provided ID is an organization-level ruleset
ruleset view	parents	p	b		Whether to include rulesets configured at higher levels that also apply (default true)
ruleset view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
ruleset view	web	w	b		Open the ruleset in the browser
run	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run cancel	force		b		Force cancel a workflow run
run cancel	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run download	dir	D	v		The directory to download artifacts into (default ".")
run download	name	n	v	artifacts	Download artifacts that match any of the given names
run download	pattern	p	v		Download artifacts that match a glob pattern
run download	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run list	all	a	b		Include disabled workflows
run list	branch	b	v	branches	Filter runs by branch
run list	commit	c	v	commits	Filter runs by the SHA of the commit
run list	created		v		Filter runs by the date it was created
run list	event	e	v	events	Filter runs by which event triggered the run
run list	jq	q	v		Filter JSON output using a jq expression
run list	json		v	json-fields	Output JSON with the specified fields
run list	limit	L	i		Maximum number of runs to fetch (default 20)
run list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run list	status	s	v	=queued|completed|in_progress|requested|waiting|pending|action_required|cancelled|failure|neutral|skipped|stale|startup_failure|success|timed_out	Filter runs by status: {queued|completed|in_progress|requested|waiting|pending|action_required|cancelled|failure|neutral|skipped|stale|startup_failure|success|timed_out}
run list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
run list	user	u	v		Filter runs by user who triggered the run
run list	workflow	w	v	workflows	Filter runs by workflow
run rerun	debug	d	b		Rerun with debug logging
run rerun	failed		b		Rerun only failed jobs, including dependencies
run rerun	job	j	v	run-jobs	Rerun a specific job ID from a run, including dependencies
run rerun	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run view	attempt	a	i		The attempt number of the workflow run
run view	exit-status		b		Exit with non-zero status if run failed
run view	job	j	v	run-jobs	View a specific job ID from a run
run view	jq	q	v		Filter JSON output using a jq expression
run view	json		v	json-fields	Output JSON with the specified fields
run view	log		b		View full log for either a run or specific job
run view	log-failed		b		View the log for any failed steps in a run or specific job
run view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
run view	template	t	v		Format JSON output using a Go template; see "gh help formatting"
run view	verbose	v	b		Show job steps
run view	web	w	b		Open run in the browser
run watch	compact		b		Show only relevant/failed steps
run watch	exit-status		b		Exit with non-zero status if run fails
run watch	interval	i	i		Refresh interval in seconds (default 3)
run watch	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
search code	extension		v		Filter on file extension
search code	filename		v		Filter on filename
search code	jq	q	v		Filter JSON output using a jq expression
search code	json		v	json-fields	Output JSON with the specified fields
search code	language		v		Filter results by language
search code	limit	L	i		Maximum number of code results to fetch (default 30)
search code	match		v	=file|path	Restrict search to file contents or file path: {file|path}
search code	owner		v	owners	Filter on owner
search code	repo	R	v	repos	Filter on repository, in OWNER/REPO format
search code	size		v		Filter on size range, in kilobytes
search code	template	t	v		Format JSON output using a Go template; see "gh help formatting"
search code	web	w	b		Open the search query in the web browser
search commits	author		v	users	Filter by author
search commits	author-date		v		Filter based on authored date
search commits	author-email		v		Filter on author email
search commits	author-name		v		Filter on author name
search commits	committer		v		Filter by committer
search commits	committer-date		v		Filter based on committed date
search commits	committer-email		v		Filter on committer email
search commits	committer-name		v		Filter on committer name
search commits	hash		v		Filter by commit hash
search commits	jq	q	v		Filter JSON output using a jq expression
search commits	json		v	json-fields	Output JSON with the specified fields
search commits	limit	L	i		Maximum number of commits to fetch (default 30)
search commits	merge		b		Filter on merge commits
search commits	order		v	=asc|desc	Order of commits returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
search commits	owner		v	owners	Filter on repository owner
search commits	parent		v	issues	Filter by parent hash
search commits	repo	R	v	repos	Filter on repository, in OWNER/REPO format
search commits	sort		v	=author-date|committer-date	Sort fetched commits: {author-date|committer-date} (default "best-match")
search commits	template	t	v		Format JSON output using a Go template; see "gh help formatting"
search commits	tree		v		Filter by tree hash
search commits	visibility		v	=public|private|internal	Filter based on repository visibility: {public|private|internal}
search commits	web	w	b		Open the search query in the web browser
search issues	app		v		Filter by GitHub App author
search issues	archived		b		Filter based on the repository archived state {true|false}
search issues	assignee		v	users	Filter by assignee
search issues	author		v	users	Filter by author (use --app to filter by a GitHub App)
search issues	closed		v		Filter on closed at date
search issues	commenter		v	me	Filter based on comments by user
search issues	comments		v		Filter on number of comments
search issues	created		v		Filter based on created at date
search issues	include-prs		b		Include pull requests in results
search issues	interactions		v		Filter on number of reactions and comments
search issues	involves		v	me	Filter based on involvement of user
search issues	jq	q	v		Filter JSON output using a jq expression
search issues	json		v	json-fields	Output JSON with the specified fields
search issues	label		v	labels	Filter on label
search issues	language		v		Filter based on the coding language
search issues	limit	L	i		Maximum number of results to fetch (default 30)
search issues	locked		b		Filter on locked conversation status
search issues	match		v	=title|body|comments	Restrict search to specific field of issue: {title|body|comments}
search issues	mentions		v	me	Filter based on user mentions
search issues	milestone		v	milestones	Filter by milestone title
search issues	no-assignee		b		Filter on missing assignee
search issues	no-label		b		Filter on missing label
search issues	no-milestone		b		Filter on missing milestone
search issues	no-project		b		Filter on missing project
search issues	order		v	=asc|desc	Order of results returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
search issues	owner		v	owners	Filter on repository owner
search issues	project		v		Filter on project board owner/number
search issues	reactions		v		Filter on number of reactions
search issues	repo	R	v	repos	Filter on repository, in OWNER/REPO format
search issues	search-type		v	=lexical|semantic|hybrid	Type of issue search to perform: {lexical|semantic|hybrid} (default "lexical")
search issues	sort		v	=comments|created|interactions|reactions|reactions-+1|reactions--1|reactions-heart|reactions-smile|reactions-tada|reactions-thinking_face|updated	Sort fetched results: {comments|created|interactions|reactions|reactions-+1|reactions--1|reactions-heart|reactions-smile|reactions-tada|reactions-thinking_face|updated} (default "best-match")
search issues	state		v	=open|closed	Filter based on state: {open|closed}
search issues	team-mentions		v		Filter based on team mentions
search issues	template	t	v		Format JSON output using a Go template; see "gh help formatting"
search issues	updated		v		Filter on last updated at date
search issues	visibility		v	=public|private|internal	Filter based on repository visibility: {public|private|internal}
search issues	web	w	b		Open the search query in the web browser
search prs	app		v		Filter by GitHub App author
search prs	archived		b		Filter based on the repository archived state {true|false}
search prs	assignee		v	users	Filter by assignee
search prs	author		v	users	Filter by author (use --app to filter by a GitHub App)
search prs	base	B	v		Filter on base branch name
search prs	checks		v	=pending|success|failure	Filter based on status of the checks: {pending|success|failure}
search prs	closed		v		Filter on closed at date
search prs	commenter		v	me	Filter based on comments by user
search prs	comments		v		Filter on number of comments
search prs	created		v		Filter based on created at date
search prs	draft		b		Filter based on draft state
search prs	head	H	v		Filter on head branch name
search prs	interactions		v		Filter on number of reactions and comments
search prs	involves		v	me	Filter based on involvement of user
search prs	jq	q	v		Filter JSON output using a jq expression
search prs	json		v	json-fields	Output JSON with the specified fields
search prs	label		v	labels	Filter on label
search prs	language		v		Filter based on the coding language
search prs	limit	L	i		Maximum number of results to fetch (default 30)
search prs	locked		b		Filter on locked conversation status
search prs	match		v	=title|body|comments	Restrict search to specific field of issue: {title|body|comments}
search prs	mentions		v	me	Filter based on user mentions
search prs	merged		b		Filter based on merged state
search prs	merged-at		v		Filter on merged at date
search prs	milestone		v	milestones	Filter by milestone title
search prs	no-assignee		b		Filter on missing assignee
search prs	no-label		b		Filter on missing label
search prs	no-milestone		b		Filter on missing milestone
search prs	no-project		b		Filter on missing project
search prs	order		v	=asc|desc	Order of results returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
search prs	owner		v	owners	Filter on repository owner
search prs	project		v		Filter on project board owner/number
search prs	reactions		v		Filter on number of reactions
search prs	repo	R	v	repos	Filter on repository, in OWNER/REPO format
search prs	review		v	=none|required|approved|changes_requested	Filter based on review status: {none|required|approved|changes_requested}
search prs	review-requested		v	me	Filter on user or team requested to review
search prs	reviewed-by		v	me	Filter on user who reviewed
search prs	sort		v	=comments|reactions|reactions-+1|reactions--1|reactions-smile|reactions-thinking_face|reactions-heart|reactions-tada|interactions|created|updated	Sort fetched results: {comments|reactions|reactions-+1|reactions--1|reactions-smile|reactions-thinking_face|reactions-heart|reactions-tada|interactions|created|updated} (default "best-match")
search prs	state		v	=open|closed	Filter based on state: {open|closed}
search prs	team-mentions		v		Filter based on team mentions
search prs	template	t	v		Format JSON output using a Go template; see "gh help formatting"
search prs	updated		v		Filter on last updated at date
search prs	visibility		v	=public|private|internal	Filter based on repository visibility: {public|private|internal}
search prs	web	w	b		Open the search query in the web browser
search repos	archived		b		Filter based on the repository archived state {true|false}
search repos	created		v		Filter based on created at date
search repos	followers		v		Filter based on number of followers
search repos	forks		v		Filter on number of forks
search repos	good-first-issues		v		Filter on number of issues with the 'good first issue' label
search repos	help-wanted-issues		v		Filter on number of issues with the 'help wanted' label
search repos	include-forks		v	=false|true|only	Include forks in fetched repositories: {false|true|only}
search repos	jq	q	v		Filter JSON output using a jq expression
search repos	json		v	json-fields	Output JSON with the specified fields
search repos	language		v		Filter based on the coding language
search repos	license		v	licenses	Filter based on license type
search repos	limit	L	i		Maximum number of repositories to fetch (default 30)
search repos	match		v	=name|description|readme	Restrict search to specific field of repository: {name|description|readme}
search repos	number-topics		v		Filter on number of topics
search repos	order		v	=asc|desc	Order of repositories returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
search repos	owner		v	owners	Filter on owner
search repos	size		v		Filter on a size range, in kilobytes
search repos	sort		v	=forks|help-wanted-issues|stars|updated	Sort fetched repositories: {forks|help-wanted-issues|stars|updated} (default "best-match")
search repos	stars		v		Filter on number of stars
search repos	template	t	v		Format JSON output using a Go template; see "gh help formatting"
search repos	topic		v		Filter on topic
search repos	updated		v		Filter on last updated at date
search repos	visibility		v	=public|private|internal	Filter based on visibility: {public|private|internal}
search repos	web	w	b		Open the search query in the web browser
secret	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
secret delete	app	a	v	=actions|agents|codespaces|dependabot	Delete a secret for a specific application: {actions|agents|codespaces|dependabot}
secret delete	env	e	v	environments	Delete a secret for an environment
secret delete	org	o	v	orgs	Delete a secret for an organization
secret delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
secret delete	user	u	b		Delete a secret for your user
secret list	app	a	v	=actions|agents|codespaces|dependabot	List secrets for a specific application: {actions|agents|codespaces|dependabot}
secret list	env	e	v	environments	List secrets for an environment
secret list	jq	q	v		Filter JSON output using a jq expression
secret list	json		v	json-fields	Output JSON with the specified fields
secret list	org	o	v	orgs	List secrets for an organization
secret list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
secret list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
secret list	user	u	b		List a secret for your user
secret set	app	a	v	=actions|agents|codespaces|dependabot	Set the application for a secret: {actions|agents|codespaces|dependabot}
secret set	body	b	v		The value for the secret (reads from standard input if not specified)
secret set	env	e	v	environments	Set deployment environment secret
secret set	env-file	f	f		Load secret names and values from a dotenv-formatted file
secret set	no-repos-selected		b		No repositories can access the organization secret
secret set	no-store		b		Print the encrypted, base64-encoded value instead of storing it on GitHub
secret set	org	o	v	orgs	Set organization secret
secret set	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
secret set	repos	r	v	repos	List of repositories that can access an organization or user secret
secret set	user	u	b		Set a secret for your user
secret set	visibility	v	v	=all|private|selected	Set visibility for an organization secret: {all|private|selected} (default "private")
skill install	agent		v		Target agent (see supported values above)
skill install	all		b		Install all skills without prompting for skill selection
skill install	allow-hidden-dirs		b		Include skills in hidden directories (e.g. .claude/skills/, .agents/skills/)
skill install	dir		v		Install to a custom directory (overrides --agent and --scope)
skill install	force	f	b		Overwrite existing skills without prompting
skill install	from-local		b		Treat the argument as a local directory path instead of a repository
skill install	pin		v		Pin to a specific git tag or commit SHA
skill install	scope		v	=project|user	Installation scope: {project|user} (default "project")
skill install	upstream		b		Install from the upstream source when a re-published skill is detected
skill list	agent		v	=github-copilot|claude-code|cursor|codex|gemini-cli|antigravity|antigravity-cli|antigravity2.0|adal|amp|augment|bob|cline|codebuddy|command-code|continue|cortex|crush|deepagents|devin|droid|firebender|goose|grok|iflow-cli|junie|kilo|kimi-cli|kiro-cli|kode|mcpjam|mistral-vibe|mux|neovate|openclaw|opencode|openhands|pi|pochi|qoder|qwen-code|replit|roo|trae|trae-cn|universal|warp|zencoder	Filter by target agent: {github-copilot|claude-code|cursor|codex|gemini-cli|antigravity|antigravity-cli|antigravity2.0|adal|amp|augment|bob|cline|codebuddy|command-code|continue|cortex|crush|deepagents|devin|droid|firebender|goose|grok|iflow-cli|junie|kilo|kimi-cli|kiro-cli|kode|mcpjam|mistral-vibe|mux|neovate|openclaw|opencode|openhands|pi|pochi|qoder|qwen-code|replit|roo|trae|trae-cn|universal|warp|zencoder}
skill list	dir		v		Scan a custom directory for installed skills
skill list	jq	q	v		Filter JSON output using a jq expression
skill list	json		v	json-fields	Output JSON with the specified fields
skill list	scope		v	=project|user	Filter by installation scope: {project|user}
skill list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
skill preview	allow-hidden-dirs		b		Include skills in hidden directories (e.g. .claude/skills/, .agents/skills/)
skill publish	dry-run		b		Validate without publishing
skill publish	fix		b		Auto-fix issues where possible without publishing (e.g. strip install metadata)
skill publish	tag		v		Version tag for the release (e.g. v1.0.0)
skill search	jq	q	v		Filter JSON output using a jq expression
skill search	json		v	json-fields	Output JSON with the specified fields
skill search	limit	L	i		Maximum number of results per page (default 15)
skill search	owner		v	owners	Filter results to a specific GitHub user or organization
skill search	page		i		Page number of results to fetch (default 1)
skill search	template	t	v		Format JSON output using a Go template; see "gh help formatting"
skill update	all		b		Update all skills without prompting
skill update	dir		v		Scan a custom directory for installed skills
skill update	dry-run		b		Report available updates without modifying files
skill update	force		b		Re-download even if already up to date
skill update	unpin		b		Clear pinned version and include pinned skills in update
ssh-key add	title	t	v		Title for the new key
ssh-key add	type		v	=authentication|signing	Type of the ssh key: {authentication|signing} (default "authentication")
ssh-key delete	yes	y	b		Skip the confirmation prompt
status	exclude	e	v	repos	Comma separated list of repos to exclude in owner/name format
status	org	o	v	orgs	Report status within an organization
variable	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
variable delete	env	e	v	environments	Delete a variable for an environment
variable delete	org	o	v	orgs	Delete a variable for an organization
variable delete	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
variable get	env	e	v	environments	Get a variable for an environment
variable get	jq	q	v		Filter JSON output using a jq expression
variable get	json		v	json-fields	Output JSON with the specified fields
variable get	org	o	v	orgs	Get a variable for an organization
variable get	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
variable get	template	t	v		Format JSON output using a Go template; see "gh help formatting"
variable list	env	e	v	environments	List variables for an environment
variable list	jq	q	v		Filter JSON output using a jq expression
variable list	json		v	json-fields	Output JSON with the specified fields
variable list	org	o	v	orgs	List variables for an organization
variable list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
variable list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
variable set	body	b	v		The value for the variable (reads from standard input if not specified)
variable set	env	e	v	environments	Set deployment environment variable
variable set	env-file	f	f		Load variable names and values from a dotenv-formatted file
variable set	org	o	v	orgs	Set organization variable
variable set	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
variable set	repos	r	v	repos	List of repositories that can access an organization variable
variable set	visibility	v	v	=all|private|selected	Set visibility for an organization variable: {all|private|selected} (default "private")
workflow	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
workflow disable	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
workflow enable	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
workflow list	all	a	b		Include disabled workflows
workflow list	jq	q	v		Filter JSON output using a jq expression
workflow list	json		v	json-fields	Output JSON with the specified fields
workflow list	limit	L	i		Maximum number of workflows to fetch (default 50)
workflow list	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
workflow list	template	t	v		Format JSON output using a Go template; see "gh help formatting"
workflow run	field	F	v		Add a string parameter in key=value format, respecting @ syntax (see "gh help api").
workflow run	json		b		Read workflow inputs as JSON via STDIN
workflow run	raw-field	f	v		Add a string parameter in key=value format
workflow run	ref	r	v	branches	Branch or tag name which contains the version of the workflow file you'd like to run
workflow run	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
workflow view	ref	r	v		The branch or tag name which contains the version of the workflow file you'd like to view
workflow view	repo	R	v	repos	Select another repository using the [HOST/]OWNER/REPO format
workflow view	web	w	b		Open workflow in the browser
workflow view	yaml	y	b		View the workflow yaml file
'#

# Command aliases gh accepts (`pr co`), and the command each stands for.
const GH_ALIASES = r#'
agent-tasks	agent-task
agent	agent-task
agents	agent-task
alias ls	alias list
at	attestation
cache ls	cache list
cs	codespace
codespace ls	codespace list
cs ls	codespace list
config ls	config list
discussion ls	discussion list
extensions	extension
ext	extension
ext ls	extension list
extension ls	extension list
extensions ls	extension list
ext uninstall	extension remove
extension uninstall	extension remove
extensions uninstall	extension remove
gist new	gist create
gist ls	gist list
gpg-key ls	gpg-key list
issue artifact new	issue artifact create
issue artifact ls	issue artifact list
issue new	issue create
issue ls	issue list
label ls	label list
org ls	org list
pr co	pr checkout
pr new	pr create
pr ls	pr list
project ls	project list
release new	release create
release ls	release list
repo autolink new	repo autolink create
repo autolink ls	repo autolink list
repo new	repo create
repo deploy-key ls	repo deploy-key list
repo gitignore ls	repo gitignore list
repo license ls	repo license list
repo ls	repo list
rs	ruleset
rs ls	ruleset list
ruleset ls	ruleset list
run ls	run list
secret remove	secret delete
secret ls	secret list
skills	skill
skill add	skill install
skills add	skill install
skill ls	skill list
skills ls	skill list
skill show	skill preview
skills show	skill preview
ssh-key ls	ssh-key list
variable remove	variable delete
variable ls	variable list
workflow ls	workflow list
'#

const GH_HELP_TOPICS = [
    [value description];
    [accessibility "Learn about GitHub CLI's accessibility experiences"]
    [actions "Learn about working with GitHub Actions"]
    [environment "Environment variables that can be used with gh"]
    [exit-codes "Exit codes used by gh"]
    [formatting "Formatting options for JSON data exported from gh"]
    [mintty "Information about using gh with MinTTY"]
    [reference "A comprehensive reference of all gh commands"]
    [telemetry "Information about telemetry in gh"]
]

const GH_API_ENDPOINTS = [
    [value description];
    [graphql "GraphQL API"]
    [user "The authenticated user"]
    [user/repos "Repositories of the authenticated user"]
    [user/orgs "Organizations of the authenticated user"]
    [notifications "Notifications of the authenticated user"]
    [rate_limit "Rate limit status"]
    ["repos/{owner}/{repo}" "The current repository"]
    ["repos/{owner}/{repo}/branches" "Branches"]
    ["repos/{owner}/{repo}/commits" "Commits"]
    ["repos/{owner}/{repo}/contents" "Contents"]
    ["repos/{owner}/{repo}/contributors" "Contributors"]
    ["repos/{owner}/{repo}/issues" "Issues"]
    ["repos/{owner}/{repo}/issues/comments" "Issue comments"]
    ["repos/{owner}/{repo}/labels" "Labels"]
    ["repos/{owner}/{repo}/milestones" "Milestones"]
    ["repos/{owner}/{repo}/pulls" "Pull requests"]
    ["repos/{owner}/{repo}/pulls/comments" "Pull request review comments"]
    ["repos/{owner}/{repo}/releases" "Releases"]
    ["repos/{owner}/{repo}/releases/latest" "Latest release"]
    ["repos/{owner}/{repo}/tags" "Tags"]
    ["repos/{owner}/{repo}/actions/runs" "Workflow runs"]
    ["repos/{owner}/{repo}/actions/workflows" "Workflows"]
    ["repos/{owner}/{repo}/actions/artifacts" "Artifacts"]
    ["repos/{owner}/{repo}/actions/caches" "Actions caches"]
    ["repos/{owner}/{repo}/actions/secrets" "Actions secrets"]
    ["repos/{owner}/{repo}/actions/variables" "Actions variables"]
    ["repos/{owner}/{repo}/collaborators" "Collaborators"]
    ["repos/{owner}/{repo}/deployments" "Deployments"]
    ["repos/{owner}/{repo}/environments" "Environments"]
    ["repos/{owner}/{repo}/forks" "Forks"]
    ["repos/{owner}/{repo}/hooks" "Webhooks"]
    ["repos/{owner}/{repo}/rulesets" "Rulesets"]
    ["repos/{owner}/{repo}/stargazers" "Stargazers"]
    ["repos/{owner}/{repo}/topics" "Topics"]
    ["search/code" "Search code"]
    ["search/commits" "Search commits"]
    ["search/issues" "Search issues and pull requests"]
    ["search/repositories" "Search repositories"]
    ["search/users" "Search users"]
]

const GH_SCOPES = [
    repo repo:status repo_deployment public_repo repo:invite security_events
    admin:repo_hook write:repo_hook read:repo_hook admin:org write:org read:org
    admin:public_key write:public_key read:public_key admin:org_hook gist notifications
    user read:user user:email user:follow project read:project delete_repo
    write:packages read:packages delete:packages admin:gpg_key write:gpg_key read:gpg_key
    codespace workflow admin:ssh_signing_key write:ssh_signing_key read:ssh_signing_key
    copilot audit_log read:audit_log admin:enterprise manage_runners:enterprise
    manage_billing:enterprise read:enterprise
]

const GH_EVENTS = [
    branch_protection_rule check_run check_suite create delete deployment
    deployment_status discussion discussion_comment fork gollum issue_comment issues
    label merge_group milestone page_build public pull_request pull_request_review
    pull_request_review_comment pull_request_target push registry_package release
    repository_dispatch schedule status watch workflow_call workflow_dispatch workflow_run
]

const GH_PROMPT_TYPES = [
    select multi-select multi-select-with-search input password confirm auth-token
    confirm-deletion input-hostname markdown-editor
]

# A completion value that Nushell parses back to the same string, so it is quoted
# only when it is not a plain word (spaces, globs, leading dash, octal-looking ints).
def gh-bare [text: string]: nothing -> bool {
    ($text =~ '^[\w@./:+=,%][\w@./:+=,%-]*$') and ($text !~ '^0[0-9xob]') and $text != 'null'
}

# Completion records for rows of {value, description}. With `--multi`, the text up to
# the last comma of the current word is kept, for flags that take comma-separated lists.
def gh-items [token: record, --multi]: list<record> -> record {
    let text = $token.text? | default '' | str trim -c '"' | str trim -c "'"
    let prefix = if $multi { $text | str replace -r '[^,]*$' '' } else { '' }
    let completions = $in | each {|row|
        let full = $"($prefix)($row.value)"
        let description = $row.description? | default ''
        if (gh-bare $full) {
            {value: $full, description: $description}
        } else {
            {value: ($full | to nuon), display_override: $full, description: $description}
        }
    }
    {options: {sort: false, case_sensitive: false}, completions: $completions}
}

def gh-rows [description: string = '']: list<string> -> list<record> {
    each {|value| {value: $value, description: $description} }
}

# Words of the command line up to (but excluding) the word under the cursor. The first
# entry of `place.command` is the resolved command name, e.g. `gh pr view`.
def gh-words [place: record]: nothing -> list<string> {
    let command = $place.command? | default []
    if ($command | is-empty) { return [] }
    $command.0 | split row ' ' | append ($command | skip 1 | drop 1)
    | each {|word| $word | str trim -c '"' | str trim -c "'" }
}

# Value of the last occurrence of one of `names` (`--repo x`, `--repo=x`, `-R x`, `-Rx`).
def gh-flag-value [words: list<string>, names: list<string>]: nothing -> any {
    $words | enumerate | each {|it|
        $names | each {|name|
            if $it.item == $name {
                $words | get -o ($it.index + 1)
            } else if ($name | str starts-with '--') and ($it.item | str starts-with $"($name)=") {
                $it.item | str substring (($name | str length) + 1)..
            } else if ($name =~ '^-\w$') and ($it.item | str starts-with $name) and ($it.item | str length) > 2 {
                $it.item | str substring 2..
            }
        }
    } | flatten | compact | last
}

# Run gh for a completer. Returns null instead of failing when gh is missing, the
# directory is not a repository, the user is signed out, or the network is down.
const GH_QUIET_ENV = {GH_PROMPT_DISABLED: '1', GH_NO_UPDATE_NOTIFIER: '1', NO_COLOR: '1'}

def gh-run [words: list<string>, args: list<string>]: nothing -> any {
    let repo = gh-flag-value $words [--repo -R]
    let env_vars = $GH_QUIET_ENV | merge (if $repo == null { {} } else { {GH_REPO: $repo} })
    let result = try { with-env $env_vars { '' | ^gh ...$args | complete } } catch { return null }
    if $result.exit_code != 0 { return null }
    $result.stdout
}

def gh-json [words: list<string>, args: list<string>]: nothing -> any {
    let out = gh-run $words $args
    if $out == null { return null }
    try { $out | from json } catch { null }
}

# A cached `gh api` call; `{owner}`/`{repo}` follow `-R` on the line or the current repo.
def gh-api [words: list<string>, ttl: string, endpoint: string, jq: string]: nothing -> list {
    gh-json $words [api --cache $ttl $endpoint --jq $jq] | default []
}

def --wrapped gh-git-lines [...args: string]: nothing -> list<string> {
    let result = try { ^git ...$args | complete } catch { return [] }
    if $result.exit_code != 0 { return [] }
    $result.stdout | lines
}

# Directory that holds gh's config.yml and hosts.yml.
def gh-config-dir []: nothing -> path {
    if ($env.GH_CONFIG_DIR? | is-not-empty) { return $env.GH_CONFIG_DIR }
    if ($env.XDG_CONFIG_HOME? | is-not-empty) { return ($env.XDG_CONFIG_HOME | path join gh) }
    if $nu.os-info.name == 'windows' and ($env.AppData? | is-not-empty) {
        return ($env.AppData | path join 'GitHub CLI')
    }
    $nu.home-dir | path join .config gh
}

def gh-hosts-file []: nothing -> record {
    let file = gh-config-dir | path join hosts.yml
    if not ($file | path exists) { return {} }
    try { open --raw $file | from yaml | default {} } catch { {} }
}

# Command rows of GH_COMMANDS: {path, kinds, desc}.
def gh-commands []: nothing -> table<path: string, kinds: string, desc: string> {
    $GH_COMMANDS | lines | where $it != '' | split column "\t" path kinds desc
}

# Flag rows of GH_FLAGS for one command: {long, short, kind, completer, desc}.
def gh-flags [path: string]: nothing -> table {
    $GH_FLAGS | lines | where {|line| $line starts-with $"($path)\t" }
    | split column "\t" path long short kind completer desc
}

# The command path (with aliases resolved) and its spec, from the words on the line.
def gh-spec [words: list<string>, commands?: table]: nothing -> record {
    let commands = if $commands == null { gh-commands } else { $commands }
    let aliases = $GH_ALIASES | lines | where $it != '' | split column "\t" alias path
    mut path = ''
    mut used = 0
    for word in ($words | skip 1) {
        if $word !~ '^[a-z][a-z0-9-]*$' { break }
        let candidate = [$path $word] | where $it != '' | str join ' '
        let canonical = if $candidate in $commands.path { $candidate } else { $aliases | where alias == $candidate | get -o 0.path }
        if $canonical == null { break }
        $path = $canonical
        $used += 1
    }
    let path = $path
    let row = $commands | where path == $path | get -o 0
    let flags = gh-flags $path
    let valued = $flags | where kind != b | each {|f| [$"--($f.long)"] | append (if $f.short != '' { [$"-($f.short)"] } else { [] }) } | flatten
    {
        path: $path, rest: ($words | skip ($used + 1)), flags: $flags, valued: $valued
        pos: ($row.kinds? | default '' | split row ' ' | where $it != ''), desc: ($row.desc? | default '')
    }
}

# Positional words after the command path, and whether `--` was seen.
def gh-positionals [spec: record]: nothing -> record {
    mut positionals = []
    mut skip_value = false
    mut after_dashes = false
    for word in $spec.rest {
        if $skip_value { $skip_value = false; continue }
        if not $after_dashes and $word == '--' { $after_dashes = true; continue }
        if not $after_dashes and ($word | str starts-with '-') and $word != '-' {
            if $word in $spec.valued { $skip_value = true }
            continue
        }
        $positionals = $positionals | append $word
    }
    {words: $positionals, after_dashes: $after_dashes}
}

def gh-kind [spec: record, index: int]: nothing -> string {
    let pos = $spec.pos
    if $index < ($pos | length) { return ($pos | get $index | str replace '...' '') }
    let last = $pos | last
    if $last != null and ($last | str ends-with '...') { $last | str replace '...' '' } else { 'none' }
}

# Flag names of a command, for a word that starts with `-`.
def gh-flag-rows [spec: record]: nothing -> list<record> {
    $spec.flags | each {|flag|
        [{value: $"--($flag.long)", description: $flag.desc}]
        | append (if $flag.short != '' { [{value: $"-($flag.short)", description: $flag.desc}] } else { [] })
    } | flatten | append {value: '--help', description: 'Show help for command'}
}

def gh-prs [words: list<string>, state: string]: nothing -> list<record> {
    let query = if $state == 'open' { 'open' } else { 'closed' }
    let jq = '[.[] | {number, title, branch: .head.ref, author: .user.login, merged: (.merged_at != null)}]'
    gh-api $words 1m $"repos/{owner}/{repo}/pulls?state=($query)&sort=updated&direction=desc&per_page=50" $jq
    | where {|pr| $state == 'open' or ($pr.merged == ($state == 'merged')) }
    | each {|pr| {value: $"($pr.number)", description: $"($pr.title) [($pr.branch)] by ($pr.author)"} }
}

def gh-issues [words: list<string>, state: string]: nothing -> list<record> {
    let jq = '[.[] | select(.pull_request == null) | {number, title, author: .user.login}]'
    gh-api $words 1m $"repos/{owner}/{repo}/issues?state=($state)&sort=updated&direction=desc&per_page=50" $jq
    | each {|issue| {value: $"($issue.number)", description: $"($issue.title) by ($issue.author)"} }
}

def gh-repos []: nothing -> list<record> {
    let remotes = gh-git-lines remote --verbose
        | parse -r '^(?<remote>\S+)\s+\S*github\.com[:/](?<repo>[^/\s]+/[^/\s]+?)(?:\.git)?/?\s'
        | uniq-by repo
        | each {|it| {value: $it.repo, description: $"git remote ($it.remote)"} }
    let mine = gh-api [] 1h 'user/repos?per_page=100&sort=pushed' '[.[] | {name: .full_name, description}]'
        | each {|repo| {value: $repo.name, description: ($repo.description | default '')} }
    $remotes | append $mine | uniq-by value
}

def gh-branches [words: list<string>]: nothing -> list<string> {
    if (gh-flag-value $words [--repo -R]) == null {
        let local = gh-git-lines for-each-ref '--format=%(refname:lstrip=2)' refs/heads
        let remote = gh-git-lines for-each-ref '--format=%(refname:lstrip=3)' refs/remotes | where $it != 'HEAD'
        let branches = $local | append $remote | uniq
        if ($branches | is-not-empty) { return $branches }
    }
    gh-api $words 10m 'repos/{owner}/{repo}/branches?per_page=100' '[.[].name]'
}

def gh-orgs []: nothing -> list<record> {
    gh-api [] 1h 'user/orgs?per_page=100' '[.[] | {login, description}]'
    | each {|org| {value: $org.login, description: ($org.description | default 'Organization')} }
}

def gh-positional [words: list<string>, index: int]: nothing -> any {
    gh-positionals (gh-spec $words) | get words | get -o $index
}

def gh-labels [words: list<string>]: nothing -> list<record> {
    gh-api $words 10m 'repos/{owner}/{repo}/labels?per_page=100' '[.[] | {name, description}]'
    | each {|label| {value: $label.name, description: ($label.description | default '')} }
}

def gh-releases [words: list<string>]: nothing -> list<record> {
    let jq = '[.[] | {tag: .tag_name, name, draft, prerelease}]'
    gh-api $words 10m 'repos/{owner}/{repo}/releases?per_page=50' $jq
    | each {|release|
        let kind = if $release.draft { ' (draft)' } else if $release.prerelease { ' (pre-release)' } else { '' }
        {value: $release.tag, description: $"($release.name | default '')($kind)"}
    }
}

def gh-gist-files [words: list<string>]: nothing -> list<record> {
    let gist = gh-positional $words 0
    if $gist == null { return [] }
    let id = $gist | split row / | last
    gh-api [] 10m $"gists/($id)" '[.files[] | {filename, language}]'
    | each {|file| {value: $file.filename, description: ($file.language | default 'File')} }
}

# REST endpoint listing secrets or variables for the scope selected on the line
# (`--org`, `--env`, `--user`, `--app`), like `gh secret list` would.
def gh-secrets-endpoint [words: list<string>, what: string]: nothing -> string {
    let org = gh-flag-value $words [--org -o]
    let env_name = gh-flag-value $words [--env -e]
    let app = gh-flag-value $words [--app -a] | default actions
    if $org != null { return $"orgs/($org)/($app)/($what)?per_page=100" }
    if $env_name != null { return $"repos/{owner}/{repo}/environments/($env_name | url encode)/($what)?per_page=100" }
    if $what == 'secrets' and ([--user -u] | any {|flag| $flag in $words }) {
        return 'user/codespaces/secrets?per_page=100'
    }
    $"repos/{owner}/{repo}/($app)/($what)?per_page=100"
}

def gh-run-id [words: list<string>]: nothing -> any {
    gh-positional $words 0 | default (gh-flag-value $words [--run-id])
}

def gh-skill-names []: nothing -> list<record> {
    gh-json [] [skill list --json 'skillName,scope'] | default []
    | each {|skill| {value: $skill.skillName, description: $"Skill \(($skill.scope)\)"} }
    | uniq-by value
}

def gh-config-keys []: nothing -> list<record> {
    gh-run [] [config --help] | default ''
    | lines
    | parse -r '^- `(?<value>[^`]+)`: (?<description>.*)$'
}

def gh-help-commands [first?: string]: nothing -> list<record> {
    let commands = gh-commands | where path != '' and path != 'help'
    if $first == null {
        $commands | where path !~ ' ' | each {|c| {value: $c.path, description: $c.desc} } | append $GH_HELP_TOPICS
    } else {
        $commands | where {|c| $c.path starts-with $"($first) " } | each {|c| $c.path | split row ' ' | get 1 }
        | uniq | gh-rows Subcommand
    }
}

# User aliases from gh's config.yml (`gh alias set`), as {name: expansion}.
def gh-user-aliases []: nothing -> record {
    let file = gh-config-dir | path join config.yml
    if not ($file | path exists) { return {} }
    try { open --raw $file | from yaml | get -o aliases | default {} } catch { {} }
}

# Installed extensions, from gh's data directory (`gh extension list` would cost a gh start).
def gh-extensions []: nothing -> list<string> {
    let base = if ($env.XDG_DATA_HOME? | is-not-empty) {
        $env.XDG_DATA_HOME | path join gh
    } else if $nu.os-info.name == 'windows' and ($env.LocalAppData? | is-not-empty) {
        $env.LocalAppData | path join 'GitHub CLI'
    } else {
        $nu.home-dir | path join .local share gh
    }
    let dir = $base | path join extensions
    if not ($dir | path exists) { return [] }
    ls $dir | where type in [dir symlink] | get name | path basename | where $it starts-with 'gh-' | str replace 'gh-' ''
}

# Replace a leading user alias with what it stands for (`gh co 12` -> `gh pr checkout 12`).
# A `!` alias runs a shell command; only a `gh <command>` inside it is followed.
def gh-expand-alias [words: list<string>, commands: table]: nothing -> list<string> {
    let aliases = gh-user-aliases
    mut words = $words
    for _ in 1..8 {
        let name = $words | get -o 1
        if $name == null or ($name in $commands.path) { break }
        let value = $aliases | get -o $name
        if $value == null { break }
        let expansion = if ($value starts-with '!') {
            let parts = $value | str substring 1.. | split row -r '\s+'
            let start = $parts | enumerate | where item == gh | get -o 0.index
            if $start == null { [] } else { $parts | skip ($start + 1) | take until {|w| $w in [';' '&&' '||' '|'] } }
        } else {
            $value | split row -r '\s+' | where $it != ''
        }
        let expansion = $expansion | where $it !~ '^\$'
        if ($expansion | is-empty) { break }
        $words = [gh] | append $expansion | append ($words | skip 2)
    }
    $words
}

# Completions for one positional slot kind.
def gh-complete-kind [kind: string, words: list<string>]: nothing -> any {
    match $kind {
        none => []
        file => null
        gh-command => {
            let aliases = gh-user-aliases | transpose value description
                | update description {|it| $"Alias for ($it.description)" }
            let extensions = gh-extensions | each {|name| {value: $name, description: 'Extension'} }
            $aliases | append $extensions
        }
        pr => (gh-prs $words open)
        pr-closed => (gh-prs $words closed)
        pr-merged => (gh-prs $words merged)
        issue => (gh-issues $words open)
        issue-closed => (gh-issues $words closed)
        repo => (gh-repos)
        branch => (gh-branches $words | gh-rows Branch)
        owner => {
            let me = gh-api [] 1h user '[.login]' | gh-rows 'You'
            $me | append (gh-orgs)
        }
        release => (gh-releases $words)
        release-asset => {
            let tag = gh-positional $words 0
            if $tag == null { return [] }
            gh-api $words 10m $"repos/{owner}/{repo}/releases/tags/($tag | url encode)" '[.assets[] | {name, size}]'
            | each {|asset| {value: $asset.name, description: $"($asset.size | into filesize)"} }
        }
        workflow => {
            gh-api $words 10m 'repos/{owner}/{repo}/actions/workflows?per_page=100' '[.workflows[] | {name, path, state}]'
            | each {|wf| {value: ($wf.path | path basename), description: $"($wf.name) \(($wf.state)\)"} }
        }
        run => {
            let jq = '[.workflow_runs[] | {id, name, title: .display_title, status, conclusion, branch: .head_branch}]'
            gh-api $words 1m 'repos/{owner}/{repo}/actions/runs?per_page=30' $jq
            | each {|run| {value: $"($run.id)", description: $"($run.name): ($run.title) [($run.branch)] ($run.conclusion | default $run.status)"} }
        }
        cache => {
            gh-api $words 1m 'repos/{owner}/{repo}/actions/caches?per_page=100' '[.actions_caches[] | {id, key, ref}]'
            | each {|cache| {value: $"($cache.id)", description: $"($cache.key) \(($cache.ref)\)"} }
        }
        gist => {
            gh-api [] 5m 'gists?per_page=100' '[.[] | {id, description, files: (.files | keys)}]'
            | each {|gist| {value: $gist.id, description: ($gist.description | default ($gist.files | str join ', '))} }
        }
        gist-file => (gh-gist-files $words)
        secret => {
            let endpoint = gh-secrets-endpoint $words secrets
            gh-api $words 1m $endpoint '[.secrets[] | {name, updated_at}]'
            | each {|secret| {value: $secret.name, description: $"Updated ($secret.updated_at)"} }
        }
        variable => {
            let endpoint = gh-secrets-endpoint $words variables
            gh-api $words 1m $endpoint '[.variables[] | {name, value}]'
            | each {|var| {value: $var.name, description: $var.value} }
        }
        label => (gh-labels $words)
        alias => (gh-user-aliases | transpose value description)
        extension => (gh-extensions | gh-rows Extension)
        skill => (gh-skill-names)
        ssh-key => {
            gh-api [] 10m 'user/keys?per_page=100' '[.[] | {id, title}]'
            | each {|key| {value: $"($key.id)", description: $key.title} }
        }
        gpg-key => {
            gh-api [] 10m 'user/gpg_keys?per_page=100' '[.[] | {key_id, emails: [.emails[].email]}]'
            | each {|key| {value: $key.key_id, description: ($key.emails | str join ', ')} }
        }
        ruleset => {
            gh-api $words 10m 'repos/{owner}/{repo}/rulesets?per_page=100' '[.[] | {id, name, enforcement}]'
            | each {|rule| {value: $"($rule.id)", description: $"($rule.name) \(($rule.enforcement)\)"} }
        }
        deploy-key => {
            gh-api $words 10m 'repos/{owner}/{repo}/keys?per_page=100' '[.[] | {id, title}]'
            | each {|key| {value: $"($key.id)", description: $key.title} }
        }
        autolink => {
            gh-api $words 10m 'repos/{owner}/{repo}/autolinks' '[.[] | {id, key_prefix, url_template}]'
            | each {|link| {value: $"($link.id)", description: $"($link.key_prefix) -> ($link.url_template)"} }
        }
        project => {
            let owner = gh-flag-value $words [--owner] | default '@me'
            gh-json [] [project list --owner $owner --format json --limit 50] | default {projects: []}
            | get projects | each {|project| {value: $"($project.number)", description: $project.title} }
        }
        discussion => {
            let query = 'query($owner: String!, $repo: String!) { repository(owner: $owner, name: $repo) { discussions(first: 50, orderBy: {field: UPDATED_AT, direction: DESC}) { nodes { number title } } } }'
            gh-json $words [api --cache 5m graphql -F 'owner={owner}' -F 'repo={repo}' -f $"query=($query)" --jq '.data.repository.discussions.nodes']
            | default [] | each {|d| {value: $"($d.number)", description: $d.title} }
        }
        gitignore => (gh-api [] 24h gitignore/templates '.' | gh-rows Template)
        license => {
            gh-api [] 24h licenses '[.[] | {key, name}]' | each {|lic| {value: $lic.key, description: $lic.name} }
        }
        config-key => (gh-config-keys)
        config-value => {
            let key = gh-positional $words 0
            gh-config-keys | where value == $key | get -o 0.description | default ''
            | parse -r '`\{(?<values>[^}]+)\}`' | get -o 0.values | default ''
            | split row '|' | str trim | where $it != '' | gh-rows
        }
        help-topic => (gh-help-commands)
        help-subcommand => (gh-help-commands (gh-positional $words 0))
        prompt-type => ($GH_PROMPT_TYPES | gh-rows 'Prompt type')
        api-endpoint => $GH_API_ENDPOINTS
        _ => []
    }
}

# The value of a flag (`--label <tab>`, `--label=<tab>`): its completer or fixed values.
def gh-flag-value-rows [flag: record, token: record, place: record]: nothing -> any {
    if $flag.kind == f { return null }
    let source = $flag.completer
    if ($source | str starts-with '=') {
        return ($source | str substring 1.. | split row '|' | gh-rows | gh-items $token)
    }
    match $source {
        '' => []
        repos => (nu-complete gh repos $token)
        json-fields => (nu-complete gh json-fields $token $place)
        labels => (nu-complete gh labels $token $place)
        users => (nu-complete gh users $token $place)
        me => (nu-complete gh me $token)
        milestones => (nu-complete gh milestones $token $place)
        branches => (nu-complete gh branches $token $place)
        cache-refs => (nu-complete gh cache-refs $token $place)
        workflows => (nu-complete gh workflows $token $place)
        orgs => (nu-complete gh orgs $token)
        owners => (nu-complete gh owners $token)
        hosts => (nu-complete gh hosts $token)
        accounts => (nu-complete gh accounts $token)
        codespaces => (nu-complete gh codespaces $token)
        environments => (nu-complete gh environments $token $place)
        projects => (nu-complete gh projects $token $place)
        scopes => (nu-complete gh scopes $token)
        gitignores => (nu-complete gh gitignores $token)
        licenses => (nu-complete gh licenses $token)
        issues => (nu-complete gh issues $token $place)
        issue-templates => (nu-complete gh issue-templates $token)
        run-jobs => (nu-complete gh run-jobs $token $place)
        artifacts => (nu-complete gh artifacts $token $place)
        gist-files => (nu-complete gh gist-files $token $place)
        releases => (nu-complete gh releases $token $place)
        commits => (nu-complete gh commits $token)
        repo-topics => (nu-complete gh repo-topics $token $place)
        events => (nu-complete gh events $token)
        http-methods => (nu-complete gh http-methods $token)
        api-headers => (nu-complete gh api-headers $token)
        close-reasons => (nu-complete gh close-reasons $token)
        lock-reasons => (nu-complete gh lock-reasons $token)
        archive-formats => (nu-complete gh archive-formats $token)
        _ => []
    }
}

# Prefix completion values with `--flag=` (quoting again where needed).
def gh-prefixed [prefix: string]: any -> any {
    let out = $in
    if $out == null { return null }
    let rows = if ($out | describe | str starts-with 'record') { $out.completions } else { $out }
    let rows = $rows | each {|row|
        let text = $"($prefix)($row.display_override? | default $row.value)"
        if (gh-bare $text) { {value: $text, description: ($row.description? | default '')} } else {
            {value: ($text | to nuon), display_override: $text, description: ($row.description? | default '')}
        }
    }
    {options: {sort: false, case_sensitive: false}, completions: $rows}
}

# Completions for everything after `gh`.
def "nu-complete gh" [token: record, place: record] {
    let commands = gh-commands
    let words = gh-expand-alias (gh-words $place) $commands
    let spec = gh-spec $words $commands
    let text = $token.text
    # `place` for the completers: the resolved command followed by its arguments.
    let inner = {command: ([$"gh ($spec.path)" | str trim] | append $spec.rest | append $text)}
    let positionals = gh-positionals $spec
    # The cursor is where a subcommand goes.
    let children = $commands | where {|c| $c.path =~ $'^($spec.path | str replace -a '-' '\-') ?[a-z0-9-]+$' and $c.path != $spec.path and ($c.path | split row ' ' | length) == (($spec.path | split row ' ' | where $it != '' | length) + 1) }
    if ($children | is-not-empty) and ($spec.rest | is-empty) and not ($text starts-with '-') {
        let rows = $children | each {|c| {value: ($c.path | split row ' ' | last), description: $c.desc} }
        let extra = if $spec.path == '' { gh-complete-kind gh-command $words } else { [] }
        return ($rows | append $extra | gh-items $token)
    }
    if ($text starts-with '-') {
        if $positionals.after_dashes { return null }
        let eq = $text | parse --regex '^(?<flag>--[^=]+)=(?<rest>.*)$' | get -o 0
        if $eq != null {
            let flag = $spec.flags | where long == ($eq.flag | str substring 2..) | get -o 0
            if $flag == null or $flag.kind == b { return [] }
            return (gh-flag-value-rows $flag ($token | update text $eq.rest) $inner | gh-prefixed $"($eq.flag)=")
        }
        return (gh-flag-rows $spec)
    }
    if $positionals.after_dashes { return null }
    # The value of the flag just before the cursor.
    let prev = $spec.rest | last
    if $prev in $spec.valued {
        let flag = $spec.flags | where {|f| $"--($f.long)" == $prev or ($f.short != '' and $"-($f.short)" == $prev) } | get 0
        return (gh-flag-value-rows $flag $token $inner)
    }
    let rows = gh-complete-kind (gh-kind $spec ($positionals.words | length)) $words
    if $rows == null { return null }
    $rows | gh-items $token
}

def "nu-complete gh json-fields" [token: record, place: record] {
    let spec = gh-spec (gh-words $place)
    # gh lists the fields on stderr when `--json` has no value; it needs no network for that.
    let result = try { with-env $GH_QUIET_ENV { '' | ^gh ...($spec.path | split row ' ') --json | complete } } catch { return [] }
    $result.stderr | lines | skip 1 | str trim | where $it != '' | gh-rows Field | gh-items $token --multi
}

def "nu-complete gh repos" [token: record] { gh-repos | gh-items $token --multi }

def "nu-complete gh labels" [token: record, place: record] {
    gh-labels (gh-words $place) | gh-items $token --multi
}

def "nu-complete gh users" [token: record, place: record] {
    let users = gh-api (gh-words $place) 10m 'repos/{owner}/{repo}/assignees?per_page=100' '[.[].login]'
    ['@me'] | append $users | gh-rows User | gh-items $token --multi
}

def "nu-complete gh me" [token: record] { ['@me'] | gh-rows 'The authenticated user' | gh-items $token }

def "nu-complete gh milestones" [token: record, place: record] {
    gh-api (gh-words $place) 10m 'repos/{owner}/{repo}/milestones?state=all&per_page=100' '[.[] | {title, state, due_on}]'
    | each {|m| {value: $m.title, description: $"($m.state) ($m.due_on | default '')"} }
    | gh-items $token
}

def "nu-complete gh branches" [token: record, place: record] {
    gh-branches (gh-words $place) | gh-rows Branch | gh-items $token
}

def "nu-complete gh cache-refs" [token: record, place: record] {
    gh-branches (gh-words $place) | each {|b| $"refs/heads/($b)" } | gh-rows Ref | gh-items $token
}

def "nu-complete gh workflows" [token: record, place: record] {
    gh-complete-kind workflow (gh-words $place) | gh-items $token
}

def "nu-complete gh orgs" [token: record] { gh-orgs | gh-items $token }

def "nu-complete gh owners" [token: record] {
    [{value: '@me', description: 'The authenticated user'}] | append (gh-orgs) | gh-items $token --multi
}

def "nu-complete gh hosts" [token: record] {
    gh-hosts-file | columns | append github.com | uniq | gh-rows Host | gh-items $token
}

def "nu-complete gh accounts" [token: record] {
    gh-hosts-file | items {|host, conf|
        $conf.users? | default {} | columns | each {|user| {value: $user, description: $host} }
    } | flatten | gh-items $token
}

def "nu-complete gh codespaces" [token: record] {
    gh-api [] 1m 'user/codespaces?per_page=100' '[.codespaces[] | {name, display_name, repo: .repository.full_name, state}]'
    | each {|cs| {value: $cs.name, description: $"($cs.display_name) ($cs.repo) \(($cs.state)\)"} }
    | gh-items $token
}

def "nu-complete gh environments" [token: record, place: record] {
    gh-api (gh-words $place) 10m 'repos/{owner}/{repo}/environments' '[.environments[].name]'
    | gh-rows Environment | gh-items $token
}

def "nu-complete gh projects" [token: record, place: record] {
    let query = 'query($owner: String!, $repo: String!) { repository(owner: $owner, name: $repo) { projectsV2(first: 50) { nodes { title number } } } }'
    gh-json (gh-words $place) [api --cache 10m graphql -F 'owner={owner}' -F 'repo={repo}' -f $"query=($query)" --jq '.data.repository.projectsV2.nodes']
    | default [] | each {|p| {value: $p.title, description: $"Project ($p.number)"} }
    | gh-items $token --multi
}

def "nu-complete gh scopes" [token: record] { $GH_SCOPES | gh-rows Scope | gh-items $token --multi }

def "nu-complete gh gitignores" [token: record] {
    gh-complete-kind gitignore [] | gh-items $token
}

def "nu-complete gh licenses" [token: record] {
    gh-complete-kind license [] | gh-items $token --multi
}

def "nu-complete gh issues" [token: record, place: record] {
    gh-issues (gh-words $place) open | gh-items $token --multi
}

def "nu-complete gh issue-templates" [token: record] {
    let root = gh-git-lines rev-parse --show-toplevel | get -o 0
    if $root == null { return [] }
    let dir = $root | path join .github ISSUE_TEMPLATE
    if not ($dir | path exists) { return [] }
    ls $dir | where type == 'file' | get name
    | where {|f| ($f | path parse | get extension) in [md yml yaml] and ($f | path basename) != 'config.yml' }
    | each {|f| open --raw $f | lines | where $it =~ '^name:' | get -o 0 }
    | compact | str replace -r '^name:\s*' '' | str trim -c '"' | str trim -c "'"
    | gh-rows 'Issue template' | gh-items $token
}

def "nu-complete gh run-jobs" [token: record, place: record] {
    let words = gh-words $place
    let run = gh-run-id $words
    if $run == null { return [] }
    gh-api $words 1m $"repos/{owner}/{repo}/actions/runs/($run)/jobs?per_page=100" '[.jobs[] | {id, name, conclusion, status}]'
    | each {|job| {value: $"($job.id)", description: $"($job.name) ($job.conclusion | default $job.status)"} }
    | gh-items $token
}

def "nu-complete gh artifacts" [token: record, place: record] {
    let words = gh-words $place
    let run = gh-run-id $words
    let endpoint = if $run == null {
        'repos/{owner}/{repo}/actions/artifacts?per_page=100'
    } else {
        $"repos/{owner}/{repo}/actions/runs/($run)/artifacts?per_page=100"
    }
    gh-api $words 1m $endpoint '[.artifacts[].name]' | uniq | gh-rows Artifact | gh-items $token
}

def "nu-complete gh gist-files" [token: record, place: record] {
    gh-gist-files (gh-words $place) | gh-items $token
}

def "nu-complete gh releases" [token: record, place: record] {
    gh-releases (gh-words $place) | gh-items $token
}

def "nu-complete gh commits" [token: record] {
    gh-git-lines log -n 50 '--format=%h%x09%s' | split column "\t" value description | gh-items $token
}

def "nu-complete gh repo-topics" [token: record, place: record] {
    let words = gh-words $place
    let repo = gh-positional $words 0
    let endpoint = if $repo == null { 'repos/{owner}/{repo}/topics' } else { $"repos/($repo)/topics" }
    gh-api $words 10m $endpoint '.names' | gh-rows Topic | gh-items $token --multi
}

def "nu-complete gh events" [token: record] { $GH_EVENTS | gh-rows Event | gh-items $token }

def "nu-complete gh http-methods" [token: record] {
    [GET POST PUT PATCH DELETE HEAD] | gh-rows 'HTTP method' | gh-items $token
}

def "nu-complete gh api-headers" [token: record] {
    ['Accept: application/vnd.github+json' 'Accept: application/vnd.github.raw+json'
        'Accept: application/vnd.github.diff' 'X-GitHub-Api-Version: 2022-11-28']
    | gh-rows Header | gh-items $token
}

def "nu-complete gh close-reasons" [token: record] {
    [completed 'not planned' duplicate] | gh-rows Reason | gh-items $token
}

def "nu-complete gh lock-reasons" [token: record] {
    [off_topic resolved spam too_heated] | gh-rows Reason | gh-items $token
}

def "nu-complete gh archive-formats" [token: record] {
    [zip tar.gz] | gh-rows Format | gh-items $token
}


export extern "gh" [
    ...args: external_arg@"nu-complete gh"  # a gh command or alias, and its arguments
]

# Review comments of a pull request, with the diff hunk each one is attached to
export def "gh pr view inlined-comments" [
    pr?: int       # pull request number (default: the pull request of the current branch)
    repo?: string  # e.g. nushell/nu_scripts (default: the current repository)
] {
    let pr = if ($pr == null) { ^gh pr view --json number | from json | get number } else { $pr }
    let repo = if ($repo == null) {
        ^gh repo view --json name,owner | from json | select owner.login name | rename owner name
    } else {
        $repo | parse '{owner}/{name}' | get 0
    }

    (^gh api
        -H "Accept: application/vnd.github+json"
        -H "X-GitHub-Api-Version: 2022-11-28"
        $"/repos/($repo.owner)/($repo.name)/pulls/($pr)/comments")
    | from json
    | select user.login body diff_hunk
    | rename user comment diff
}

def "gh get stars" [
    end_cursor: string = ""  # endCursor from a previous query
    --first: int = 100  # returns the first n elements from the list
] {
    # https://docs.github.com/en/graphql/reference/objects#user
    ^gh api graphql -F $'first=($first)' -F $'endCursor=($end_cursor)' -f query='
      query($first: Int, $endCursor: String!){
        viewer {
          starredRepositories(first: $first, after: $endCursor, orderBy: {field: STARRED_AT, direction: DESC}) {
            edges { node { url description } starredAt }
            pageInfo { hasNextPage endCursor }
          }
        }
      }
    '
    | from json | select data.viewer.starredRepositories.edges data.viewer.starredRepositories.pageInfo
    | rename stars pageInfo
}

# Repositories the authenticated user has starred, oldest star first
export def "gh my stars" [] {
    mut stars = []
    mut end_cursor = ""
    loop {
        let part = gh get stars $end_cursor
        $stars = $stars | append $part.stars
        if $part.pageInfo?.hasNextPage? == true {
            $end_cursor = $part.pageInfo.endCursor
        } else {
            break
        }
    }
    $stars | flatten | update cells { $in | into datetime } starredAt | sort-by starredAt
}
