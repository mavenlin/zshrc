# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
fi
if [ ! -f $ZSH/antigen.zsh ]; then
    curl -L git.io/antigen > $ZSH/antigen.zsh
fi
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(python pip virtualenv)

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='emacs'
fi

unsetopt share_history

export TERM=xterm-256color

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.oh-my-zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# python plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv
antigen theme romkatv/powerlevel10k
# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma-continuum/fast-syntax-highlighting
# Tell Antigen that you're done.
antigen apply

# export VIRTUAL_ENV_DISABLE_PROMPT=12
case `uname` in
  Darwin)
    # alias emacs='[[ -z `pgrep -l -f "emacs.*daemon"` ]] && emacs --daemon; emacsclient -c -nw'
  ;;
  Linux)
    if [ -z ${INSIDE_EMACS+x} ]; then
	alias emacs="TERM=alacritty-direct emacs -nw" && alias emacs-gui="/usr/bin/emacs"
    else
	alias emacs="echo 'calling emacs in emacs, aborting'"
    fi
  ;;
esac

export TZ="/usr/share/zoneinfo/Singapore"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZSHRC_DIR=$(dirname $(readlink ${(%):-%x}))
[[ ! -f $ZSHRC_DIR/.p10k.zsh ]] || source $ZSHRC_DIR/.p10k.zsh
export PATH=$PATH:$ZSHRC_DIR/bin:/opt/homebrew/bin:$HOME/.emacs.d/bin:$HOME/.local/bin:/Library/TeX/texbin:/opt/clang-format-static

# local configuration
if [ -f ~/.paths ]; then
    source ~/.paths
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GDK_SCALE=2
eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/linmin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/linmin/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/linmin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/linmin/google-cloud-sdk/completion.zsh.inc'; fi
