# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew osx bgnotify vi-mode vagrant tmux npm node grunt)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/payton/.rvm/gems/ruby-2.0.0-p247/bin:/Users/payton/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/payton/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/payton/.rvm/bin:/Users/payton/.rvm/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/var/lib/gems/1.8/bin:/usr/local/share/npm/bin:/var/lib/gems/1.8/bin:/Users/payton/bin:/usr/local/share/npm/bin"
export PATH=$PATH:/Users/payton/.composer/vendor/bin

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# vim-mode configuration
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^R' history-incremental-search-backward

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"
alias mcsync='unison -ui text -repeat watch dev-mc'
alias usyn='unison -ui text -repeat watch automattic-sandbox'
alias unisync-force-local='unison -ui text -auto -force "/Users/payton/Code/automattic-sandbox" automattic-sandbox'
alias unisync-force-remote='unison -ui text -auto -force "ssh://wpdev@wpsandbox//home/wpcom/public_html" automattic-sandbox'
alias pitsync='unison -ui text -repeat watch the-pit-of-despair'
alias gtsync='unison -ui text -repeat watch guided-transfer'
alias ls="ls -G -F"

# Use rg for fzf to ignore gitignore contents
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_ALT_C_COMMAND='find . -maxdepth 1 -type d'
# Enable fzf auto completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Bind CTRL-W to cd with fuzzy-search
bindkey '^W' fzf-cd-widget

# Set environment variable for socks proxy address for using Phabricator (arc):
export SOCKS5PROXY="127.0.0.1:8080"

# Enable autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
