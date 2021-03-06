FROM elixir:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix local.hex --force

CMD mix deps.get && mix phx.server