#!/usr/bin/env zsh

export ZLE_RPROMPT_INDENT=0
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export EDITOR=nvim

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern regexp)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_REGEXP+=('^\s*sudo' fg=red,bold)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=27,bg=255'
ZSH_HIGHLIGHT_STYLES[alias]='fg=162,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=2,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=22,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=28,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=202,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,underline'
ZSH_HIGHLIGHT_STYLES[assign]='fg=39'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=255,bg=27,bold'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 'ma=97;1'

alias ls='ls --color=auto'
alias diff='diff --color'
alias grep='grep --color'

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt multios
setopt prompt_subst

bindkey -e

bindkey -M emacs "${terminfo[khome]}" beginning-of-line
bindkey -M emacs "${terminfo[kend]}"  end-of-line
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^H' backward-kill-word
bindkey -M emacs '^?' backward-delete-char
bindkey -M emacs "${terminfo[kdch1]}" delete-char

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# functions
COPY () xclip -selection clipboard < "${1:-unset}"
PATH () xargs -n1 <<< "${PATH//:/ }"
MELD2 () meld ~/.a ~/.b
MELD3 () meld ~/.a ~/.b ~/.c
