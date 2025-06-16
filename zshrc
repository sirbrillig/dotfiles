# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Antigen is a plugin manager for zsh
# Some bug in antigen? https://github.com/zsh-users/antigen/issues/543
# ANTIGEN_MUTEX=false
# source "${HOME}/bin/antigen.zsh"

# antigen bundle mafredri/zsh-async
# This doesn't seem to work or do anything at all
# antigen bundle allanjamesvestal/fast-zsh-nvm
# AUTO_LOAD_NVMRC_FILES=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/payton/.rvm/gems/ruby-2.0.0-p247/bin:/Users/payton/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/payton/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/payton/.rvm/bin:/Users/payton/.rvm/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/var/lib/gems/1.8/bin:/usr/local/share/npm/bin:/var/lib/gems/1.8/bin:/Users/payton/bin:/usr/local/share/npm/bin:/usr/local/sbin"
export PATH=$PATH:/Users/payton/vendor/bin

export EDITOR='nvim'

# vim-mode configuration
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^R' history-incremental-search-backward

alias mcsync='unison -ui text -repeat watch dev-mc'
alias usyn='unison -ui text -repeat watch automattic-sandbox'
alias usyn-force-local='unison -ui text -auto -force "/Users/payton/Code/automattic-sandbox" automattic-sandbox'
alias usyn-force-remote='unison -ui text -auto -force "ssh://wpdev@wpsandbox//home/wpcom/public_html" automattic-sandbox'
alias ls="ls -G -F"

# Use rg for fzf to ignore gitignore contents
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_ALT_C_COMMAND='find . -maxdepth 1 -type d'

export NVM_DIR="$HOME/.nvm"
# This is super slow; see https://superuser.com/a/1611283/2783000
# So we load nvm only when we enter a directory which has an .nvmrc file.
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias load-nvm='source "$NVM_DIR/nvm.sh"'
autoload -U add-zsh-hook
load-nvmrc() {
	local nvmrc_path
	nvmrc_path=".nvmrc"
	if [ -f "$nvmrc_path" ]; then
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/payton/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
