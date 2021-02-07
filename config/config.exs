# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :githubr,
  ecto_repos: [Githubr.Repo]

# Configures the endpoint
config :githubr, GithubrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YJxmd4fKUztKRU+mSb8qqag6Amr7EcMbZNaSDXkFWDXDL9IUhBeC80aiIRRcacgj",
  render_errors: [view: GithubrWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Githubr.PubSub,
  live_view: [signing_salt: "8/cLAdh1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
