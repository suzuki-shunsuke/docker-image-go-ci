# docker-image-go-ci

[![GitHub last commit](https://img.shields.io/github/last-commit/suzuki-shunsuke/docker-image-go-ci.svg)](https://github.com/suzuki-shunsuke/docker-image-go-ci)
[![GitHub tag](https://img.shields.io/github/tag/suzuki-shunsuke/docker-image-go-ci.svg)](https://github.com/suzuki-shunsuke/docker-image-go-ci/releases)
[![License](http://img.shields.io/badge/license-mit-blue.svg?style=flat-square)](https://raw.githubusercontent.com/suzuki-shunsuke/docker-image-go-ci/master/LICENSE)

Docker Image for Golang Project's CI

https://hub.docker.com/r/suzukishunsuke/go-ci/

* Debian Stretch
* Golang 1.11.2
* [dep](https://github.com/golang/dep)
* [dep-dl](https://github.com/take-cheeze/dep-dl) https://github.com/golang/dep/issues/289#issuecomment-385968184
  * revision: [3334a5a8c01cd00a8039cdfafc2698ae81617c2b](https://github.com/take-cheeze/dep-dl/tree/3334a5a8c01cd00a8039cdfafc2698ae81617c2b)
* [gometalinter](https://github.com/alecthomas/gometalinter)
* [ghr v0.12.0](https://github.com/tcnksm/ghr)
* [goreleaser v0.88.0](https://goreleaser.com/)
* [gox](https://github.com/mitchellh/gox)
* Node.js 8.12.0
* npm 6.4.1

## License

[MIT](LICENSE)
