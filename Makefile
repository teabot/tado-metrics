
SHELL=/bin/bash
GITSHORTHASH=$(shell git log -1 --pretty=format:%h)
GO ?= go
VERSION ?= $(GITSHORTHASH)

# Insert build metadata into binary
LDFLAGS := -X github.com/teabot/tado-metrics/cmd.TadoMetricsVersion=$(VERSION)
LDFLAGS += -X github.com/teabot/tado-metrics/cmd.TadoMetricsGitCommit=$(GITSHORTHASH)

.PHONY: test
test:
	$(GO) test $(shell go list ./... | grep -v /vendor/)

.PHONY: build
build: dep
	env GOOS=linux GOARCH=arm GOARM=5 $(GO) build -ldflags "$(LDFLAGS)" -o "tado-metrics"

.PHONY: package
package: build test
	tar -cvzf tado-metrics.tar.gz tado-metrics service.env INSTALL.sh

.PHONY: clean
clean:
	rm -rf tado-metrics.tar.gz tado-metrics

.PHONY: dep
dep:
	dep ensure -vendor-only
