Main: https://www.theodinproject.com/lessons/foundations-setting-up-git

## Generate new SSH key locally

- So that GitHub knows it is from your trusted computer
- `ls -al ~/.ssh` to check if there are SSH keys created already
  - If you see files called `id_ed25519` (the priv key) and `id_ed25519.pub` (the public key), you can re-use this key and skip to the next section
- To generate a new key: `ssh-keygen -t ed25519 -C <your_email@example.com>`
  - When prompted for file name to store the key, just press enter for the default location & name
  - When prompted for passphrase, **type one** unless the key will not be used for important, secure purposes
    - You can just press Enter to leave an empty passphrase
- You can always add/change passphrase by `ssh-keygen -p -f ~/.ssh/<your-private-key-name>`

**More !!!!!**

## Store passphrase in ssh-agent

- So you don't need to type it every time you push a commit, for example
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent

## Use multiple GitHub identites in the same machine

- **Main: https://gist.github.com/oanhnn/80a89405ab9023894df7**
  - **Remember to set user.name & e-mail in `git config`!!!**
- https://gist.github.com/JoaquimLey/e6049a12c8fd2923611802384cd2fb4a
- https://www.freecodecamp.org/news/manage-multiple-github-accounts-the-ssh-way-2dadc30ccaca/
- https://stackoverflow.com/questions/3860112/multiple-github-accounts-on-the-same-computer

  - provides info on how to set user name/email on directory basis

- Example `config` file:

```
#### Default, Work account
Host github.com

# For using ssh-agent to store passphrase forever
  AddKeysToAgent yes
  UseKeychain yes

# For identifying the right key
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519



### Personal account
Host github-personal

# Host name must be stated if using non-standard host above
  HostName github.com

# For identifying the right key
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519_NokTNL
```

- You can list all keys identified with `ssh-add -l`
- An example bash script that simplifies the whole clone process: `git-clone-custom.sh`
