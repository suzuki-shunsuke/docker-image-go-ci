# node
FROM node:10.16.0-stretch AS build-env

FROM golang:1.12.6 AS go-build-env
# ghr
ARG GHR_VERSION=v0.12.1
RUN wget https://github.com/tcnksm/ghr/releases/download/$GHR_VERSION/ghr_${GHR_VERSION}_linux_amd64.tar.gz
RUN tar xvzf ghr_${GHR_VERSION}_linux_amd64.tar.gz
# goreleaser
ARG GORELEASER_VERSION=v0.110.0
RUN wget https://github.com/goreleaser/goreleaser/releases/download/${GORELEASER_VERSION}/goreleaser_Linux_x86_64.tar.gz
RUN tar xvzf goreleaser_Linux_x86_64.tar.gz
# gometalinter
RUN curl -L https://git.io/vp6lP | sh
# gox
RUN go get github.com/mitchellh/gox
# dep-dl
RUN go get -u github.com/take-cheeze/dep-dl
# dep
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN ls /go/bin
# durl
ARG DURL_VERSION=0.8.0
RUN wget https://github.com/suzuki-shunsuke/durl/releases/download/v${DURL_VERSION}/durl_${DURL_VERSION}_linux_amd64.tar.gz
RUN tar xvzf durl_${DURL_VERSION}_linux_amd64.tar.gz

FROM golang:1.12.6
ARG GHR_VERSION=v0.12.1
COPY --from=build-env /usr/local/bin/node /usr/local/bin/
COPY --from=build-env /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --from=go-build-env /go/bin/* /go/ghr_${GHR_VERSION}_linux_amd64/ghr /go/goreleaser /go/durl /usr/local/bin/
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx
