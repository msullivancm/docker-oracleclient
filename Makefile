.PHONY: all build release

IMAGE=msullivancm/oracleclient
VERSION=$(shell cat VERSION)

all: build

build:
	@docker build --tag=${IMAGE} .

release: build
	@docker build --tag=${IMAGE}:${VERSION} .

deploy: release
	@docker push ${IMAGE}
	@docker push ${IMAGE}:${VERSION}
