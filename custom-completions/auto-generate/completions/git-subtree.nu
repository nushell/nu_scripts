# Manage git subtrees
extern "git subtree" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]

# Suppress output
extern "git" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]

# Add a new subtree to the repository
extern "git add" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]

# Merge changes from a subtree into the repository
extern "git merge" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]

# Extract a subtree from the repository
extern "git split" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]

# Fetch and integrate changes from a remote subtree
extern "git pull" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]

# Push changes to a remote subtree
extern "git push" [
	--quiet(-q)					# Suppress output
	--debug(-d)					# Debug output
	--path(-P)					# Path to the subtree
	--annotate					# Annotate the commit
	--branch(-b)					# Branch to split
	--ignore-joins					# Ignore joins during history reconstruction
	--onto					# Specify the commit ID to start history reconstruction
	--rejoin					# Merge the synthetic history back into the main project
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	--squash					# Merge subtree changes as a single commit
	--no-squash					# Do not merge subtree changes as a single commit
	--message(-m)					# Use the given message as the commit message for the merge commit
	...args
]