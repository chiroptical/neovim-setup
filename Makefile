SRCS=$(wildcard *.fnl)
OBJS=$(SRCS:.fnl=.lua)

all: $(OBJS)

%.lua: %.fnl
	fennel -c $< > $@

clean:
	rm -r $(OBJS)

nix-build:
	nix build

link:
	ln -s result/config.lua config.lua
	ln -s result/lsp.lua lsp.lua
