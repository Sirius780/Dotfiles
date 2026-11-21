# Disables the fish greeting
set -g fish_greeting ""

# en ingles porque no me gusta el doblaje
set -gx LC_MESSAGES en_US.UTF-8

# Replaces Cd with Zoxide
command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

# Replaces Ls with Eza
command -v eza &> /dev/null && alias ls='eza --icons --group-directories-first -1'

# Adds fzf binds through a fish plugin
fzf_configure_bindings --directory=\ct --history=\cr
