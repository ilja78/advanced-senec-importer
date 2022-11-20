FROM ruby:3.1.2-alpine
RUN apk add --no-cache build-base

WORKDIR /advanced-senec-collector
COPY Gemfile* /senec-collector/
RUN bundle config --local frozen 1 && \
    bundle config --local without 'development test' && \
    bundle install -j4 --retry 3 && \
    bundle clean --force

FROM ruby:3.1.2-alpine
LABEL maintainer="georg@ledermann.dev"
ENV MALLOC_ARENA_MAX 2
WORKDIR /advanced-senec-collector

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . /advanced-senec-collector/

ENTRYPOINT bundle exec src/main.rb

