# zsh - new machine set up notes

#### (macos) Install homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### (macos) brew install required packages
   ```
   brew install zsh git chezmoi mise bat eza coreutils gnu-sed countdown fzf
   ```
   - `zsh`
   - `git`
   - `chezmoi` 
   - `mise`
   - `bat`
   - `eza`
   - `coreutils`
   - `gnu-sed`
   - `countdown`

##### Optional brews (devops related):
```
brew install awscli helm kubectl terragrunt docker kubectx
```

- [Terraform](https://developer.hashicorp.com/terraform/intro):
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

- [graphviz](https://docs.terragrunt.com/reference/cli/commands/list#dot-format) - dot graph
`brew install graphviz`

##### ai related brews
`brew install opencode`
`brew install copilot-cli`


##### optional casks
`brew install --cask visual-studio-code`
`brew install --cask iterm2`
`brew install --cask meld`
`brew install --cask notunes`

#### Setup SSH for Github/Bitbucket access
- [GitHub SSH Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Bitbucket SSH Docs](https://support.atlassian.com/bitbucket-cloud/docs/configure-ssh-and-two-step-verification)

eg `ssh-keygen -t ed25519 -b 4096 -C "michael.tay@blueacornici.com" -f ~/.ssh/bucket`
 

## Custom Plugin/Funcitonality Setup

### [Chezmoi](https://chezmoi.io/)
- Initialize Chezmoi
```
chezmoi init git@github.com:MikeTayC/dots.git
```
- Add chemzoi config toml with appropriate values:
`~/.config/chezmoi/chezmoi.toml`
```
[git]
    autoCommit = true
    autoPush = true

[data]
    type = "work"
    machine = "M4"

[data.xdg]
    CONFIG = '.config'
    CACHE = '.cache'
    STATE = '.local/state'
    DATA = '.local/share'

[data.zsh]
    ZSH = "$HOME/.oh-my-zsh"
    ZSH_PLUGIN_MGR = 'ohmyzsh'
    ZSH_CUSTOM = ".config/zsh/custom"
    ZSH_THEME = 'powerlevel10k/powerlevel10k'
    OHMY_PLUGINS = [
        "before-plugins",
        "zsh-eza",
        "fzf-tab",
        "gitfast",
        "zsh-autosuggestions",
        "fast-syntax-highlighting",
        "history",
        "history-sync",
        "kubectl",
        "terragrunt",
    ]

[data.tools]
    brew = true
    mise = true
    chezmoi = true
    npm = true
    pnpm = true
    vim_runtime = true
    eza = true
    fzf = true
    bat = true
    zsh-autosuggestions = true
    drunk_zsh_history = true
    aws = true
    helm = true
    terragrunt = true
    terraform = true
    cafe_countdown = true
    iterm = true
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

### [fzf] (https://github.com/junegunn/fzf)
- https://formulae.brew.sh/formula/fzf
- Used in conjuction with [fzf-tab](https://github.com/aloxaf/fzf-tab)


### [bat](https://github.com/sharkdp/bat)
Config lives at `~/.config/bat/config` (via chezmoi)


### [eza](https://github.com/eza-community/eza)
Replaces GNU/ls;
https://formulae.brew.sh/formula/eza

Config lives at `~/.config/eza/theme.yaml` (via chezmoi)

Using custom zsh plugin [zsh-eza](https://github.com/z-shell/zsh-eza)

Use additional community generated themes: https://github.com/eza-community/eza-themes
```
git clone git@github.com:eza-community/eza-themes.git ~/.eza-themes
```

### [coreutils](https://formulae.brew.sh/formula/coreutils)
needed for dircolors and ls among other things

### [gnu-sed](https://formulae.brew.sh/formula/gnu-sed)
zsh plugin - history-sync requires GNU sed; before-plugins sed is replaced

### [countdown](https://formulae.brew.sh/formula/countdown)
using for terminal replacement for amphetabmine
