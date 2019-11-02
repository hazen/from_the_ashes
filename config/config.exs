# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :from_the_ashes,
  ecto_repos: [FromTheAshes.Repo]

# Configures the endpoint
config :from_the_ashes, FromTheAshesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7qBbiNyh9i2sIU6nRh3EdPWvUqHyslx2s5Ccvv/9fRZu3p9DMl6f4gwqpt/b44x0",
  render_errors: [view: FromTheAshesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FromTheAshes.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
