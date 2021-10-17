format:
	nixpkgs-fmt .
	find fnl/ -name "*.fnl" -exec fnlfmt --fix {} \;
