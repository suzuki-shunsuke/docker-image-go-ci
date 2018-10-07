FROM node:8.12.0-stretch AS build-env

FROM golang:1.11.1 AS go-build-env
ARG GHR_VERSION=v0.12.0
ARG GORELEASER_VERSION=v0.88.0
RUN wget https://github.com/tcnksm/ghr/releases/download/$GHR_VERSION/ghr_${GHR_VERSION}_linux_amd64.tar.gz
RUN tar xvzf ghr_${GHR_VERSION}_linux_amd64.tar.gz
RUN wget https://github.com/goreleaser/goreleaser/releases/download/${GORELEASER_VERSION}/goreleaser_Linux_x86_64.tar.gz
RUN tar xvzf goreleaser_Linux_x86_64.tar.gz
RUN curl -L https://git.io/vp6lP | sh
RUN go get github.com/mitchellh/gox
RUN go get -u github.com/take-cheeze/dep-dl
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN ls /go/bin

FROM golang:1.11.1
ARG GHR_VERSION=v0.12.0
ARG GORELEASER_VERSION=v0.88.0
COPY --from=build-env /usr/local/bin/node /usr/local/bin/
COPY --from=build-env /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --from=go-build-env /go/bin/* /go/ghr_${GHR_VERSION}_linux_amd64/ghr /go/goreleaser /usr/local/bin/
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx
