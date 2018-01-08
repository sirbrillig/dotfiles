set PATH $PATH ~/bin

set -Ux EDITOR vim

# Enable vim mode
fish_vi_key_bindings

# Enable autojump
# TODO: this should really be set up as an alias
. /usr/local/Cellar/autojump/22.5.1/share/autojump/autojump.fish

alias zshconfig="vim ~/.zshrc"
alias mcsync='unison -ui text -repeat watch dev-mc'
alias usyn='unison -ui text -repeat watch automattic-sandbox'
alias unisync-force-local='unison -ui text -auto -force "/Users/payton/Code/automattic-sandbox" automattic-sandbox'
alias unisync-force-remote='unison -ui text -auto -force "ssh://wpdev@wpsandbox//home/wpcom/public_html" automattic-sandbox'
alias pitsync='unison -ui text -repeat watch the-pit-of-despair'
alias gtsync='unison -ui text -repeat watch guided-transfer'
alias sandbox='ssh -t wpsandbox screen -RD'
