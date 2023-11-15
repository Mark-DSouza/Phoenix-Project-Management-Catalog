defmodule Projects.Repo do
  use Ecto.Repo,
    otp_app: :projects,
    adapter: Ecto.Adapters.Postgres
end
