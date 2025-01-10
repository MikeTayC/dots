# zsh - new machine set up notes

#### Install homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### brew install required packages
   ```
   brew install zsh git chezmoi mise bat eza coreutils gnu-sed sfcc-ci countdown
   ```
   - `zsh`
   - `git`
   - `chezmoi` 
   - `mise`
   - `bat`
   - `eza`
   - `coreutils`
   - `gnu-sed`
   - `sfcc-ci`
   - `countdown`

#### Setup SSH for Github/Bitbucket access
- [GitHub SSH Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Bitbucket SSH Docs](https://support.atlassian.com/bitbucket-cloud/docs/configure-ssh-and-two-step-verification)

#### Install forked [OhMyZsh](https://github.com/MikeTayC/ohmyzsh)
   - git clone git@github.com:MikeTayC/ohmyzsh.git
   - Ensure `master` is up to date
   - Use `miketay` branch
   - (optional) set upstream remote to https://github.com/ohmyzsh/ohmyzsh
 
---

## Custom Plugin/Funcitonality Setup

### [Chezmoi](https://chezmoi.io/)
- Initialize Chezmoi
```
chezmoi init git@github.com:MikeTayC/dots.git
```
You can install your dotfiles on new machine with a single command:

```
chezmoi init --apply git@github.com:MikeTayC/dots.git
```

###  [mise-en-place](https://mise.jdx.dev)
> [!NOTE]
> We need to use shims so we can leverage mise in Webstorm

Typically, we can run `mise activate` (see https://mise.jdx.dev/getting-started.html#_2-activate-mise), which essentially runs a command similar to:
```
echo 'eval "$(/opt/homebrew/bin/mise activate zsh)"' >> ~/.zshrc
```

We are doing othe equivalent of this in `.zprofile` (via chezmoi)
```
 export PATH="$HOME/.local/share/mise/shims:$PATH"
```

> [!WARNING]
> Temporary fix for installing node <14 on the new arm64 silicon chips with mise
> https://mise.jdx.dev/tips-and-tricks.html#macos-rosetta
> https://github.com/jdx/mise/issues/2302

```
mise settings arch=x86_64
```


Install desired node versions
```
mise use -g node@12.16.1
```

Install npx (optional)
```
mise use -g npm:npx
```

Mise/Node Additional Informaiton
- https://mise.jdx.dev/lang/node.html
- https://mise.jdx.dev/dev-tools/backends/npm.html
- https://mise.jdx.dev/mise-cookbook/nodejs.html#add-node-modules-binaries-to-the-path


### [bat](https://github.com/sharkdp/bat)
Config lives at `~/.config/bat/config` (via chezmoi)


### [eza](https://github.com/eza-community/eza)
Replaces GNU/ls;

Config lives at `~/.config/eza/theme.yaml` (via chezmoi)

Using custom zsh plugin [zsh-eza](https://github.com/z-shell/zsh-eza)

Use additional community generated themes: https://github.com/eza-community/eza-themes
```
git clone git@github.com:eza-community/eza-themes.git ~/.eza-themes
```

### coreutils 
needed for dircolors and ls among other things

### gnu-sed
zsh plugin - history-sync requires GNU sed; before-plugins sed is replaced

### countdown
using for terminal replacement for amphetabmine


other:
sfcc-ci


---------------------------

the ultimate vimrc is saved via chezmoi, new installs need to run the install script:
sh ~/.vim_runtime/install_awesome_vimrc.sh

to update ult vimrc:
cd ~/.vim_runtime && git pull --rebase && cd -
---------------------------



---------------------------
TODO
- bundle  repo drunk-zsh-history into chezmoi as submodule
