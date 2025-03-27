defmodule SensorDashboard.Repo do
  use Ecto.Repo,
    otp_app: :sensor_dashboard,
    adapter: Ecto.Adapters.Postgres
end
