format:
	alejandra .
	find fnl/ -name "*.fnl" -exec fnlfmt --fix {} \;

.PHONY: format
