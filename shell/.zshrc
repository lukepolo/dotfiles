DEFAULT_USER=`whoami`

#################################################################
### Key Bindings
#################################################################

# Allow to use home and end in terminal
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

#################################################################
### PATHS
#################################################################
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$PATH:$HOME/.composer/vendor/bin"

#################################################################
### Load Aliases functions exports
#################################################################

# Load the shell dotfiles, and then some:
for file in ~/.dotfiles/shell/.{exports,aliases,functions,secrets}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

#################################################################
### Load ZSH + Plugins
#################################################################
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"

NVM_AUTO_USE=true

plugins=(git zsh-nvm zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $(dirname $(gem which colorls))/tab_complete.sh
source ~/.oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh