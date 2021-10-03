build:
	fennel -c plug.fnl > plug.lua

format:
	find . -name "*.fnl" -exec fnlfmt --fix {} \;

clean:
	rm -r plug.lua
