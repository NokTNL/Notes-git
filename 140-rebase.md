## `git rebase`

- Merging divergent branches will result in a convergent commit tree
- `git rebase` on the other hand will create a single linear commit history. Let say we have this commit history originally:

```
__A___B___C  <--main
   \
    \__D___E  <--feature
```

- We want to merge the `feature` branch onto the `main` branch.
- Rebasing works by taking the changes happened since their common ancestor (A) to the `feature` branch tip (E), then "replay" it from the `main` branch tip (the new _base_):

```
git checkout feature    // take the changes here
git rebase main         // apply these changes onto the new base = "main"
```

- Alternatively, use `git rebase main feature`. It means base = `main` and add `feature`'s changes onto the base

Now the commit history will become:

```
__A___B___C___D'___E' <--feature
          ^
          main
```

- Note that D' and E' are not the same as the original commits because they also contain the changes happened from A-C
- Now you can merge the two branches by fast-forwarding:

```
git checkout main
git merge feature
```

## More complex rebase

- If you have _nested branches_, you may want to apply just the _difference between two side branches_ to the `main` branch because one of those branches are not yet finished. Then you will need this:

```
git rebase server client --onto main
```

It means rebase `client` onto the `server`, but instead of adding the changes to `server`, we add it to `main`.

## The golden rule of `rebase`

**Never rebase something that has been pushed to the public and may have been built above by someone else!!** It is because a branch will _disappear_ from the original hierarchy after rebasing.
