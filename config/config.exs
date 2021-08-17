# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_app,
  namespace: FeedbackApp,
  ecto_repos: [FeedbackApp.Repo]

# Configures the endpoint
config :my_app, FeedbackAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q8qcvprJYwpSeQdmgsj7ZF+kP15cPY1QHsNxWOuwGO84WYCeWN91XUBNJ0m02zNo",
  render_errors: [view: FeedbackAppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FeedbackApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "FeedbackApp",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "gNEguc6yk8CvVecRzlTshZmRnWg0BKOAxYgBnI37q4r3UdS6XehAFHIIai9ysU4Z",
  serializer: FeedbackApp.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
