defmodule SensorDashboardWeb.Router do
  use SensorDashboardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {SensorDashboardWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SensorDashboardWeb do
    pipe_through :browser

    live "/", DashboardLive.Index, :index
    live "/settings", SettingsLive, :index
    live "/history", HistoryLive, :index
    live "/login", LoginLive, :index
    live "/auth", AuthLive.Index, :index

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:sensor_dashboard, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SensorDashboardWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
