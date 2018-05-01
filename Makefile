#
# Makefile
# @author Eric Ahn <byungwook.ahn@gmail.com>
#

.PHONY: update clean build build-all run package deploy test authors dist

export GOPATH := ${PWD}
export GOBIN := ${PWD}/bin/

NAME := hulk
VERSION := $(shell cat VERSION)
LDFLAGS := -X main.version=${VERSION}

default: build

clean:
	@echo Cleaning up...
	@rm bin/* -rf
	@echo Done 

build:
	@echo Building...
	go build -v -o ./bin/$(NAME) -ldflags '${LDFLAGS}' ./src/*.go 
	@echo Done.

run: build
	./bin/$(NAME) -c 

authors:
	@git log --format='%aN <%aE>' | LC_ALL=C.UTF-8 sort | uniq -c -i | sort -nr | sed "s/^ *[0-9]* //g" > AUTHORS
	@cat AUTHORS

