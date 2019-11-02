defmodule FromTheAshes.Repo do
  use Ecto.Repo,
    otp_app: :from_the_ashes,
    adapter: Ecto.Adapters.Postgres
end
