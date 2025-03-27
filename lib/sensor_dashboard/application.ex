defmodule SensorDashboard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SensorDashboardWeb.Telemetry,
      SensorDashboard.Repo,
      {DNSCluster, query: Application.get_env(:sensor_dashboard, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SensorDashboard.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SensorDashboard.Finch},
      # Start a worker by calling: SensorDashboard.Worker.start_link(arg)
      # {SensorDashboard.Worker, arg},
      # Start to serve requests, typically the last entry
      SensorDashboardWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SensorDashboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SensorDashboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
