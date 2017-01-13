# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1="Darling [\\w]\\$ "
# Make bash check its window size after a process completes
shopt -s checkwinsize

# For colored ls output
export CLICOLOR=1

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"
