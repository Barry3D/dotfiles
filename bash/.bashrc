if command -v fzf-share >/dev/null; then
	  source "$(fzf-share)/key-bindings.bash"
	    source "$(fzf-share)/completion.bash"
fi

eval "$(zoxide init bash)"
