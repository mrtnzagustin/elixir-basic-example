FROM elixir

COPY [".", "/usr/src/app"]

WORKDIR /usr/src/app

# intalls
# inotify-tools to check file changes
# nodejs npm to handle frontend dependencies
RUN apt update && apt install inotify-tools nodejs npm -y

# Install mix package manager
RUN mix local.hex --force

CMD tail -f /dev/null
# TODO: Config wait for it with database
    # Executs setup ("deps.get", "ecto.setup", "cmd npm install --prefix assets")
    # "deps.get": Install dependencies
    # "ecto.setup" Setup for database ("ecto.create", "ecto.migrate", "run priv/repo/seeds.exs")
    # "cmd npm install --prefix assets": Install npm dependencies for frontend
# CMD ./wait-for-it.sh db:3306 -- mix setup && mix phx.server


# Run server in prod mode
# See https://hexdocs.pm/phoenix/deployment.html
# Initial setup
# $ mix deps.get --only prod
# $ MIX_ENV=prod mix compile

# # Compile assets
# $ npm run deploy --prefix ./assets
# $ mix phx.digest

# # Custom tasks (like DB migrations)
# $ MIX_ENV=prod mix ecto.migrate

# # Finally run the server
# $ PORT=4001 MIX_ENV=prod mix phx.server
