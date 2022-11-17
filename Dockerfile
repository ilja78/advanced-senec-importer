FROM ruby:3.1.2-alpine
LABEL maintainer="georg@ledermann.dev"

WORKDIR /advanced-senec-importer

COPY Gemfile* /advanced-senec-importer/
RUN bundle config --local frozen 1 && \
    bundle config --local without 'development test' && \
    bundle install -j4 --retry 3 && \
    bundle clean --force

COPY . /advanced-senec-importer/

ENTRYPOINT bundle exec src/main.rb
