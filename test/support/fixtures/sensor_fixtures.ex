defmodule SensorDashboard.SensorFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SensorDashboard.Sensor` context.
  """

  @doc """
  Generate a dashboard.
  """
  def dashboard_fixture(attrs \\ %{}) do
    {:ok, dashboard} =
      attrs
      |> Enum.into(%{

      })
      |> SensorDashboard.Sensor.create_dashboard()

    dashboard
  end

  @doc """
  Generate a settings.
  """
  def settings_fixture(attrs \\ %{}) do
    {:ok, settings} =
      attrs
      |> Enum.into(%{

      })
      |> SensorDashboard.Sensor.create_settings()

    settings
  end

  @doc """
  Generate a history.
  """
  def history_fixture(attrs \\ %{}) do
    {:ok, history} =
      attrs
      |> Enum.into(%{

      })
      |> SensorDashboard.Sensor.create_history()

    history
  end

  @doc """
  Generate a auth.
  """
  def auth_fixture(attrs \\ %{}) do
    {:ok, auth} =
      attrs
      |> Enum.into(%{

      })
      |> SensorDashboard.Sensor.create_auth()

    auth
  end
end
