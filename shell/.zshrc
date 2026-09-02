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

eval "$(/opt/homebrew/bin/brew shellenv)"

#################################################################
### Load ZSH + Plugins
#################################################################
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"

SPACESHIP_DOCKER_SHOW=false

NVM_AUTO_USE=true

plugins=(git zsh-nvm zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/luke/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/luke/.bun/_bun" ] && source "/Users/luke/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Users/luke/.codepier/bin" # Added by CodePier
