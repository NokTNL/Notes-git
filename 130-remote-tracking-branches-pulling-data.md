## Remote-tracking branches

- Remote-tracking branches have the name `<remote>/<branch>`, like `origin/main`. They are SEPERATED from the local `main` branch pointers.
- They are created when you try to get data from a remote using `git fetch` or `git pull`; more on that below
- **You can't change remote-tracking branches locally**. But you can merge them into your local branches.

## Getting data from a remote

- Primitive workflow:

  1. `git fetch <remote>` to fetch data from a remote into a newly created remote-tracking branches, if not already created:

  - if want to fetch a specific branch only: `git fetch <remote> <branch>`
  - You can fetch branches from all remote using `git fetch --all`
  - Our example here: `git fetch origin feature`

  2. The above only creates a remote-tracking branch called `origin/feature`. You will need to have a local branch set up too: `git checkout -b feature`
  3. Now you are on the `feature` branch and you can merge the remote branch into it: `git merge origin/feature`

- `checkout -b` and `merge` (Step 2 and 3 above) can be _combined_ to just one command: `git checkout -b feature origin/feature`, telling git to make a new `feature` branch based on the remote-tracking `origin/feature`

  - This has added advantage that it also set `feature` to be the **tracking branch** of `origin/feature`, and the tracked branch is called its **upstream branch**.
  - Upstream branch is relavant to `git pull`: if you run `git pull` inside the local `feature` branch now, git already knows its upstream so will fetch & merge from `origin/feature` automatically. (More on `git pull` below)

- **Shorthand of `git checkout -b feature origin/feature` --> `git checkout --track origin/feature`**

  - Can be _further_ shortened to just `git checkout feature` to create a new tracking branch, _given_ there is no such local branch existing yet and there's only one remote branch matching this name

- If want to set an upstream branch manually, or change its upstream: `git branch -u <upstream>`
- To check the list of tracking branches, run `git branch -vv`. However it only shows what you last `fetch`-ed and may not be up to date.

## `git pull`

- **!! It is safest to use when there is a branch that has its upstream set up already, e.g. by `git checkout --track <remote>/<branch>` or `git clone`**

- `git pull` acts on the current branch. It `fetch` _AND_ `merge` your curent branch into the remote branch you specified.
  - or `rebase` as an alternative to `merge`; more on rebase later

### Example

- e.g. When you are on the `main` branch and you run `git pull origin feature`, it will merge your local `main` branch into the remote-tracking `origin/feature` branch
  - **This does not set up a local `feature` branch for you!!** To do that, follow the standard `git fetch origin` then `git checkout --track origin/feature`
- e.g. You are on the `feature` branch that has its upstream set up as `origin/feature`, then simply run `git pull` without stating remote/branch. Git will then merge the latest changes from the remote `origin/feature` branch automatically

- `git clone` does all the things from a `git pull` but also adds the `origin` remote for you and set all branches' push & pull default branches to that of the equivalent inside the cloned remote

## Merging divergent remote branches to local branches

- If someone has changed the remote branch a while after you have pulled, and you edited the _same_ branch without updating from the remote, the remote and local branch will _diverge_. Example:

_Remote (origin):_

```
__A___B___C  <--main
```

_Local:_

```
__A___D___E  <--main
  ^
  origin/main (A is the last time you pulled from the remote)
```

- If you `fetch` the remote branch now (not `pull` for clarityx), you will have two divergent branches:

_Local:_

```
__A___B___C  <--origin/main (remote-tracking)
   \
    \__D___E  <--main
```

- Now you can `merge` the remote branch into the local one

## Updating remote branch deletion

`git fetch -p` or `git remote prune <remote>` _prunes_ the deleted branches
