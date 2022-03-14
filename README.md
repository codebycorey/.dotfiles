# .dotfiles

My backup and history for my dotfiles.

Easily bootstrap a new machine to fix my needs which seem to be every changing.

Git repository plus symlink make propagating dotfile changes across all machines simple.
# GNU Stow

Most of the dotfiles are symlinked using [GNU Stow](https://www.gnu.org/software/stow/)

Install on `macOS` using `homebrew`
```
brew install stow
```

#### Commands:
Install Dots repo with git:
```
curl -o- https://raw.githubusercontent.com/codebycorey/dotfiles/master/install.sh | bash
```

or directly use `git clone`
```
git clone git@github.com:codebycorey/dotfiles.git $HOME/.dotfiles
```



Once dotfiles is installed, you can install dots using either:

```bash
# initializing entire repo to environment
./bootstrap.sh
```

```bash
# Only symlink dots using stow
./scripts/dots.sh
```

