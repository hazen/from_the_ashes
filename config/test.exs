use Mix.Config

# Configure your database
config :from_the_ashes, FromTheAshes.Repo,
  username: "postgres",
  password: "postgres",
  database: "from_the_ashes_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :from_the_ashes, FromTheAshesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
