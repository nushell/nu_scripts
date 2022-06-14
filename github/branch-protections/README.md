# Branch Protections

### Definition

Do you have hundreds or thousands of GitHub repositories in your organization? Are you tired of manually managing their branch protection rules? Don't! Let nushell do it for you!

### Setup
1. Replace placeholder data in .nu script with your own (or remove the appropriate fields if you don't need to i.e push to repo from action)
1. Create a repo in your organization account to store the github action
1. Push both the attached script and the github action to the repo
### Possible future improvements
* Instead of cron run the script on repository creation event (once org level actions become a thing in GitHub)