defmodule SensorDashboardWeb.AuthController do
  use SensorDashboardWeb, :controller

  def login_success(conn, %{"user_id" => user_id}) do
    conn
    |> put_session(:user_id, user_id)
    |> configure_session(renew: true)
    |> redirect(to: "/")
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/login")
  end
end
