# Gitlab Scanner

### Definition

I use this script to scan contents of my company's GitLab server. Due to nushell's use of multithreading I'm able to scan around 1k repositories in about 9 seconds

### Setup
1. Generate GitLab Personal Access Token and save it as `GITLAB_TOKEN` environment variable
2. Run the script providing necessary data as arguments (or hardcode them in the script if you don't expect them to change often)
### Possible future improvements
* Multiple files/phrases/branches to search
* Maybe create some stats like how many times a given phrase was found in a repo or file
* Maybe offer an option to replace a phrase and automatically push the updated file or create a merge request
