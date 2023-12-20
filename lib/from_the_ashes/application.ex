defmodule FromTheAshes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FromTheAshesWeb.Telemetry,
      FromTheAshes.Repo,
      {DNSCluster, query: Application.get_env(:from_the_ashes, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FromTheAshes.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FromTheAshes.Finch},
      # Start a worker by calling: FromTheAshes.Worker.start_link(arg)
      # {FromTheAshes.Worker, arg},
      # Start to serve requests, typically the last entry
      FromTheAshesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FromTheAshes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FromTheAshesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
