# App

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## More specific
This example creates a project using Phoenix task phx.new with --no-webpack, --no-html y --database mysql.
After that, the project added a REST API with one basic Sensor entity, using task phx.gen.json

So the steps performed are:
1.  Create the project with `phx.new . --no-webpack --no-html --database mysql`
2.  Setup (basically, ecto setup): `mix setup`
3.  Add json rest api: `mix phx.gen.json PlatformI40 Sensor sensors name:string type:string sampling_rate:integer`
4.  Make sure you add routes in router.ex (api scope): `resources "/sensors", SensorController, except: [:new, :edit]`
5.  Execute migrations: `mix ecto migrate`
