defmodule SensorDashboardWeb.AuthLive.Index do
  use SensorDashboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Login")}
  end

  def handle_event("login", %{"username" => _u, "password" => _p}, socket) do
    # We'll add logic later. For now, just return the socket
    {:noreply, socket}
  end
end
