_Remote_: a copy of your repo's content that is on somewhere on the Internet/network

- A clone from Github will at least have the `origin` remote

To add a new remote: `git remote add <shortname> <url>`

- `git remote -v`: shows the origin with the URL
- `git remote show <remote>`: shows mroe details regarding that remote
- `git remote rename <old-name> <new-name>`: rename the alias of a remote
- `git remote rm <remote>` to remove a remote
  - All associated data and **remote-tracking branches** will also be delted locally

## Getting data from a remote

- `git fetch <remote>`: now the BRANCHES of that remote is accessible locally. You CAN merge it into your local branches using `git merge`. More on branching anf merging later.
  - if no remote specified, default to `origin`
- if you want your local copy to be an exact copy of a remote, run `git pull` so that it will `fetch` and (attempt to) `merge` at the same time
- `git clone` does yet nother step further by
  1. adding the `origin` remote
  2. Add a `main` branch that tracks the remote's `main` branch
  3. `git pull` into the `main` branch

## Uploading data to a remote

To upload a certein branch to a remote: `git push <remote> <branch>`
Only works if: 1. You have write access to the remote 2. Nobody has pushed before you. If someone has pushed before you (i.e. your locla version is not up to date), you need to `git fetch` + merge (or `git pull`) from the remote first
