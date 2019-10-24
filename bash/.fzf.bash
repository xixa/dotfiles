# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/xixa/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/xixa/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/xixa/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/xixa/.fzf/shell/key-bindings.bash"
