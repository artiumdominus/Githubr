defmodule Githubr.Repo do
  use Ecto.Repo,
    otp_app: :githubr,
    adapter: Ecto.Adapters.Postgres
end
