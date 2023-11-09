# Elixir Release
FROM elixir:1.15-alpine as base

# Maintainer Information
LABEL maintainer="Giovanni Armane <giovanniarmane@gmail.com>"
LABEL vendor="Giovanni Armane"

# Install system dependencies
RUN apk add --no-cache --update build-base curl inotify-tools

# Configure user, groups and working directory
RUN adduser -u 1000 -D elixir && mkdir -p /home/elixir/app
USER elixir

# Set work directory and shell
WORKDIR /home/elixir/app

CMD ["ash"]

# Development build stage
FROM base as dev

RUN mix do local.hex --force, local.rebar --force, archive.install hex phx_new --force

EXPOSE 8000

# Testing build stage
FROM base as ci

COPY . .

RUN mix do local.hex --force, local.rebar --force

RUN mix do deps.get, deps.compile, compile

# Production build stage
FROM base as prod

USER root

COPY . .

RUN mix do local.hex --force, local.rebar --force

EXPOSE 80
