all:
	@exit 0

clean:
	git clean -dfX

download:
	GOPATH=$$PWD go get -u -d github.com/globocom/tsuru/cmd/$(CMD)

_build: download
	debuild --no-tgz-check -S -sa

%:
	make CMD=$@ -C $@-deb -f ../Makefile _build
