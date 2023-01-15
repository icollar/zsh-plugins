#!/usr/bin/env zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

COPY () xclip -selection clipboard < "${1:-unset}"
PATH () xargs -n1 <<< "${PATH//:/ }"
MELD2 () meld ~/.a ~/.b
MELD3 () meld ~/.a ~/.b ~/.c
