# Foo Bank System

## Description

Elixir Phoenix framework test bank API.

## Overview

This project is comprised of the following languages and libraries:

- Language: [Elixir](https://elixir-lang.org/)
- Web framework: [Phoenix Framework](https://www.phoenixframework.org/)
- Password hashing: [Argon2](https://hexdocs.pm/argon2_elixir/api-reference.html)
- Auth library: [Guardian](https://hexdocs.pm/guardian/readme.html)
- Auth plugs: [Überauth](https://hexdocs.pm/ueberauth/readme.html)
- Auth identity strategy: [Überauth Identity](https://github.com/ueberauth/ueberauth_identity)
- Test coverage: [excoveralls](https://hexdocs.pm/excoveralls/readme.html)
- Test fixtures: [ex_machina](https://hexdocs.pm/ex_machina/readme.html)
- Test mocks: [Mock](https://hexdocs.pm/mock/Mock.html)
- Static type-checker: [Dialyxir](https://hexdocs.pm/dialyxir/readme.html)
- Docs generator: [ex_docs](https://hexdocs.pm/ex_doc/Mix.Tasks.Docs.html)

Auxiliary libraries and plugins were omitted but can be found in the
`mix.exs` files.

## Development

To start development it is recommended to have these utilities installed
in a local development machine:

- [Elixir](https://elixir-lang.org/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/)
- [Plis](https://github.com/IcaliaLabs/plis)

For better development experience, it is recommended these tools:

- [Visual Studio Code](https://code.visualstudio.com/)
- [commitizen](https://github.com/commitizen/cz-cli)

This project is already configured with VS Code IDE in mind.

The IDE should be automatically configured with standard rules and
options for optimal development experience.

Any other IDE can and should be supported. If necessary, an merge
request with a configuration file can accepted in the repository,
considering that the development experience is consistent between IDEs
and that it doesn't break compatibility and standardization between.

### Running the API

To run the API in development mode, follow these steps:

- Start a container with: `plis run --service-ports app ash`
- Setup application with: `mix setup`
- Install the missing dependencies `mix deps.get`  
- Start server with: `mix phx.server`
- Start server in interactive mode with: `iex -S mix phx.server`
- Run static type check with: `mix dialyzer`
- Run test suite with: `mix test`
- Run test suite with coverage: `mix coveralls`
- Run formatter with: `mix format`
- Generate docs with: `mix docs`

### Live Dashboard

A simple admin dashboard is configured, simply visit:
[dashboard](localhost:8000/dashboard)
