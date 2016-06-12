
all: build

build:
	guild compile -L ./ext/file-finder/lib -L ./ext/io-path/lib -L ./ext/shell-command/lib -L ./lib ./bin/gasket

build-2.2:
	guild-2.2 compile -L ./ext/file-finder/lib -L ./ext/io-path/lib -L ./ext/shell-command/lib -L ./lib ./bin/gasket
