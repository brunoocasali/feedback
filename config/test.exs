use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_app, FeedbackAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
config :bcrypt_elixir, :log_rounds, 4

# Configure your database
config :my_app, FeedbackApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "password",
  database: "feedback_test_db",
  hostname: "database",
  pool: Ecto.Adapters.SQL.Sandbox
