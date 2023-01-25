format:
	alejandra --quiet .
	find fnl/ -name "*.fnl" -exec fnlfmt --fix {} \;

.PHONY: format
