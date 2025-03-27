# lib/sensor_dashboard_web/live/logout_live/index.ex
defmodule SensorDashboardWeb.LogoutLive.Index do
  use SensorDashboardWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> clear_flash()
      |> clear_session()
      |> assign(:page_title, "You have been logged out.")

    {:ok, socket}
  end

  defp clear_session(socket) do
    Phoenix.LiveView.clear_flash(socket)
    |> redirect(to: ~p"/login", replace: true)

  end
end
