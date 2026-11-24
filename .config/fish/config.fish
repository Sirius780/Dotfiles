if status is-interactive

# Disables the fish greeting
set -g fish_greeting ""

# en ingle que el doblaje eh malisimo
set -gx LC_MESSAGES C.utf8

# Replaces Cd with Zoxide
command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

# Uses yazi to move between directories
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Calls that function with Ctrl + y
function fish_user_key_bindings
	bind \cy 'y; commandline -f repaint'
end

# Abbrs
abbr -a gs git status
abbr -a gc --set-cursor 'git commit -m "%"'
abbr -a gca --set-cursor 'git commit -am "%"'
abbr -a gp git push
abbr -a ga git add
end
