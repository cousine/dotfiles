# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/cousine/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
ZSH_CUSTOM=/Users/cousine/projects/dotfiles/cousine/ohmyzsh_customs

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  #rails
  colorize
  colored-man-pages
  cp
  docker
  zsh-interactive-cd
  zsh-completions
  zsh-autosuggestions
  zsh-tmux-rename
  taskwarrior
  emoji
)

fpath=($ZSH_CUSTOM/completions $fpath)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias q="exit"

#export TERM="xterm-256color"
moji="$(random_emoji_animal_face)\t"
BULLETTRAIN_CUSTOM_BG=220
BULLETTRAIN_CUSTOM_MSG=$moji
BULLETTRAIN_RUBY_FG=255
BULLETTRAIN_DIR_FG=17
BULLETTRAIN_CONTEXT_BG=8
BULLETTRAIN_GIT_BG=255
BULLETTRAIN_STATUS_FG=255
BULLETTRAIN_PROMPT_ORDER=(
  custom
  context
  ruby
  dir
  git
  status
)

source ~/.fzf.zsh
PROJECT_PATHS=(~/projects)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# Load SCM Breeze
[ -s "/Users/cousine/.scm_breeze/scm_breeze.sh" ] && source "/Users/cousine/.scm_breeze/scm_breeze.sh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cousine/projects/gcloud/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/cousine/projects/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cousine/projects/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/cousine/projects/gcloud/google-cloud-sdk/completion.zsh.inc'; fi

# Pyenv virtualenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Fix HOME and END key bindings
bindkey "^[[1;2H" beginning-of-line
bindkey "^[[1;2F" end-of-line

# GPG agent
export GPG_TTY=$(tty)
