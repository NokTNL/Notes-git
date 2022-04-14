- the file `.gitignore` provides **matching names** of files/directories to ignore
- Recommended to add .gitignore the first thing in a new repo

#### Rules:

- Lines starting with `#` and blank lines and are ignored
- Only file/directory that matches the **WHOLE NAME** will be ignored.

  - So if the file name is `blahh` but the matching name is `blah`, it won't match
  - the matching is done **recursively**, so `test/blah` will match `blah` as well

- A slash `/` is a **directory separator**:

  - `/Name` or `Name/Name` will limit the search relative to the directory **relative to .gitignore** and **won't search recursively**
    - So `blah` in the root directory will match the name `/blah` BUT `test/blah` (which is in children directories) won't match `/blah`
    - `test/blah` will match `*/blah` or `**/blah`; more on `*` below
  - `Name/`: ending with `/` forces .gitignore to match only **directories**
    - So the FILE `test/blah` won't match `blah/`
  - `!Name` adds **exceptions** to ignored files (given its containing directory is not ignored)

- Glob patterns:

  - `?` matches any single character
  - `*` matches zero or more characters (but not slash `/`)
  - `**` is same as an asterisk `*` but match against zero to inifinite level of directory nesting
    - By matching zero directory it means `test/blah` matches `test/**/blah`, even `blah` is not in any directories under `test`

- !!! .gitignore cannot ignore files tht are tracked already. Use `git rm --cached` to untrack them first.
