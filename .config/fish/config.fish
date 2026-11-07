command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source
command -v eza &> /dev/null && alias ls='eza --icons --group-directories-first -1'
