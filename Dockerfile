# node
# npm
# gometalinter
# bash
# dep
# golang
FROM node:8.11.3-stretch AS build-env
FROM golang:1.10.3
COPY --from=build-env /usr/local/bin/node /usr/local/bin/
COPY --from=build-env /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
ARG GHR_VERSION=v0.10.2
RUN go get -u gopkg.in/alecthomas/gometalinter.v2 && \
    ln -s $GOPATH/bin/gometalinter.v2 $GOPATH/bin/gometalinter && \
    gometalinter --install && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx && \
    wget https://github.com/tcnksm/ghr/releases/download/$GHR_VERSION/ghr_${GHR_VERSION}_linux_amd64.tar.gz && \
    tar xvzf ghr_${GHR_VERSION}_linux_amd64.tar.gz && \
    mv ghr_${GHR_VERSION}_linux_amd64/ghr /usr/local/bin && \
    rm -R ghr_${GHR_VERSION}_linux_amd64 && \
    go get github.com/mitchellh/gox
