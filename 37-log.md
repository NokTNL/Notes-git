# igt log

`git log` has loads of options and can get quite involved.

`git log -2`: shows the last two commit
`git log -p`: shows the difference in each commit compared to the last one
`git log stat`: shows stat, e.g. `35-gitignore.md | 28 ++++++++++++++++++++++++++++`
`git log --graph`: shows commit history in a tree graph
`git log --since`, `git log --until`: search for a particular range
`git log -S <string>`: search for commits that insert more/delete some of the occurences of the <string>
