# https://railsguides.jp/upgrading_ruby_on_rails.html#ruby%E3%81%AE%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3  Rails 7: Ruby 2.7.0以降が必須
# https://www.ruby-lang.org/ja/downloads/  2023/8/27時点での安定版: 3.2.2
# https://hub.docker.com/_/ruby  3.2.2-alpineを採用
FROM ruby:3.2.2-alpine

ARG WORKDIR
ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
ARG DEV_PACKAGES="build-base curl-dev"

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${HOME}

COPY Gemfile* ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    apk add --no-cache gcompat && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . .