FROM ruby:3.1.2-alpine

LABEL maintainer="georg@ledermann.dev"
ENV MALLOC_ARENA_MAX 2
WORKDIR /advanced-senec-collector



ENTRYPOINT bundle exec src/main.rb

