defmodule SensorDashboard.AuthFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SensorDashboard.Auth` context.
  """

  @doc """
  Generate a logout.
  """
  def logout_fixture(attrs \\ %{}) do
    {:ok, logout} =
      attrs
      |> Enum.into(%{

      })
      |> SensorDashboard.Auth.create_logout()

    logout
  end
end
