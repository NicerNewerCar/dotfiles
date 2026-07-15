#!/bin/bash

# 1. HISTORY CUSTOMIZATION
HISTSIZE=1000                  # Lines kept in active memory
HISTFILESIZE=2000              # Lines saved to the history file
HISTCONTROL=ignoreboth         # Ignore duplicate entries and spaces

# 2. ENVIRONMENT VARIABLES
export EDITOR='vi'           # Default text editor
export PATH="$HOME/bin:$PATH"  # Custom user binaries path

# 3. USEFUL ALIASES
alias ll='ls -lF'             # Detailed directory listing
alias l='ls -lAF'               # List hidden files except . and ..
alias grep='grep --color=auto' # Highlight text matches
alias ..='cd ..'              # Quick directory ascent
alias gaa="git add ."
alias ga="git add"
alias gc="git commit"
alias gpl="git pull"
alias gph="git push"
alias gl="git log"
alias gd="git diff"

# 4. GIT BRANCH DETECTOR FUNCTION
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# 5. CUSTOM COLOR PROMPT WITH GIT
# Displays: [username@hostname current_directory (branch_name)]$
PS1='\[\e[1;32m\][\u@\h \w]\[\e[1;36m\]$(parse_git_branch)\[\e[1;32m\]]\n\$ \[\e[0m\]'

