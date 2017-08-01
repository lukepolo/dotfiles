ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DEFAULT_USER=`whoami`
plugins=(zsh-nvm laravel5)

#################################################################
### Custom Config
#################################################################

# Allow to use home and end in terminal
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

#################################################################
### Load Aliases functions exports
#################################################################

# Load the shell dotfiles, and then some:
for file in ~/.dotfiles/shell/.{exports,aliases,functions,secrets}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

#################################################################
### Paths
#################################################################

export PATH=HOME/.dotfiles/bin:$PATH
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

export PATH="$HOME/.yarn/bin:$PATH"
export PATH=~/.config/composer/vendor/bin:~/.composer/vendor/bin:$PATH

#################################################################
### SSH Key
#################################################################

#import ssh keys in keychain
ssh-add -A 2>/dev/null
ssh-add -K ~/.ssh/id_rsa 2>/dev/null

#################################################################
### PHP
#################################################################

export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=127.0.0.1 remote_connect_back=0"

#################################################################
### Docker
#################################################################

# import environment variables for the docker-cli
if docker-machine status default | grep "Running" &> /dev/null
  then
    eval eval "$(docker-machine env default)"
fi

#################################################################
### NVM Autoloader Options
#################################################################

## You can only select one of these :-(
#export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true


#################################################################
### Load ZSH
#################################################################

source $ZSH/oh-my-zsh.sh