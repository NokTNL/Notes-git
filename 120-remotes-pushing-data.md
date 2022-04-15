_Remote_: a version of your repo's content that is hosted on somewhere on the Internet/network

- A clone from Github will at least have the `origin` remote

To add a new remote URL to your local git: `git remote add <shortname> <url>`

- `git remote -v`: shows the origin with the URL
- `git remote show <remote>`: shows mroe details regarding that remote
- `git remote rename <old-name> <new-name>`: rename the alias of a remote
- `git remote rm <remote>` to remove a remote
  - All associated data and remote-tracking branches will also be deleted locally

## Uploading data to a remote

To upload a certain branch to a remote: `git push <remote> <branch>`

- Only works if:
  1. You have write access to the remote
  2. Nobody has pushed before you. If someone has pushed before you (i.e. your local version is not up to date), you need to `git fetch` + merge (or `git pull`) from the remote first; more on that later
- You can control what name on the server the branch should be, e.g. `git push origin boring-name:awesome-name`

- If you will always push a local branch to a certain remote branch, you can set its **upstream branch**: `git push --set-upstream <remote> <branch>`
  - Next time you are on that branching and pushing, you can simply run `git push` without the need to state the remote and branch names

## Deleting a remote branch

`git push origin --delete <branch>`
