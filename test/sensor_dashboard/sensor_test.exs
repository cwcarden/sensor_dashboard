defmodule SensorDashboard.SensorTest do
  use SensorDashboard.DataCase

  alias SensorDashboard.Sensor

  describe "dashboards" do
    alias SensorDashboard.Sensor.Dashboard

    import SensorDashboard.SensorFixtures

    @invalid_attrs %{}

    test "list_dashboards/0 returns all dashboards" do
      dashboard = dashboard_fixture()
      assert Sensor.list_dashboards() == [dashboard]
    end

    test "get_dashboard!/1 returns the dashboard with given id" do
      dashboard = dashboard_fixture()
      assert Sensor.get_dashboard!(dashboard.id) == dashboard
    end

    test "create_dashboard/1 with valid data creates a dashboard" do
      valid_attrs = %{}

      assert {:ok, %Dashboard{} = dashboard} = Sensor.create_dashboard(valid_attrs)
    end

    test "create_dashboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensor.create_dashboard(@invalid_attrs)
    end

    test "update_dashboard/2 with valid data updates the dashboard" do
      dashboard = dashboard_fixture()
      update_attrs = %{}

      assert {:ok, %Dashboard{} = dashboard} = Sensor.update_dashboard(dashboard, update_attrs)
    end

    test "update_dashboard/2 with invalid data returns error changeset" do
      dashboard = dashboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensor.update_dashboard(dashboard, @invalid_attrs)
      assert dashboard == Sensor.get_dashboard!(dashboard.id)
    end

    test "delete_dashboard/1 deletes the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, %Dashboard{}} = Sensor.delete_dashboard(dashboard)
      assert_raise Ecto.NoResultsError, fn -> Sensor.get_dashboard!(dashboard.id) end
    end

    test "change_dashboard/1 returns a dashboard changeset" do
      dashboard = dashboard_fixture()
      assert %Ecto.Changeset{} = Sensor.change_dashboard(dashboard)
    end
  end

  describe "settings" do
    alias SensorDashboard.Sensor.Settings

    import SensorDashboard.SensorFixtures

    @invalid_attrs %{}

    test "list_settings/0 returns all settings" do
      settings = settings_fixture()
      assert Sensor.list_settings() == [settings]
    end

    test "get_settings!/1 returns the settings with given id" do
      settings = settings_fixture()
      assert Sensor.get_settings!(settings.id) == settings
    end

    test "create_settings/1 with valid data creates a settings" do
      valid_attrs = %{}

      assert {:ok, %Settings{} = settings} = Sensor.create_settings(valid_attrs)
    end

    test "create_settings/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensor.create_settings(@invalid_attrs)
    end

    test "update_settings/2 with valid data updates the settings" do
      settings = settings_fixture()
      update_attrs = %{}

      assert {:ok, %Settings{} = settings} = Sensor.update_settings(settings, update_attrs)
    end

    test "update_settings/2 with invalid data returns error changeset" do
      settings = settings_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensor.update_settings(settings, @invalid_attrs)
      assert settings == Sensor.get_settings!(settings.id)
    end

    test "delete_settings/1 deletes the settings" do
      settings = settings_fixture()
      assert {:ok, %Settings{}} = Sensor.delete_settings(settings)
      assert_raise Ecto.NoResultsError, fn -> Sensor.get_settings!(settings.id) end
    end

    test "change_settings/1 returns a settings changeset" do
      settings = settings_fixture()
      assert %Ecto.Changeset{} = Sensor.change_settings(settings)
    end
  end

  describe "histories" do
    alias SensorDashboard.Sensor.History

    import SensorDashboard.SensorFixtures

    @invalid_attrs %{}

    test "list_histories/0 returns all histories" do
      history = history_fixture()
      assert Sensor.list_histories() == [history]
    end

    test "get_history!/1 returns the history with given id" do
      history = history_fixture()
      assert Sensor.get_history!(history.id) == history
    end

    test "create_history/1 with valid data creates a history" do
      valid_attrs = %{}

      assert {:ok, %History{} = history} = Sensor.create_history(valid_attrs)
    end

    test "create_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensor.create_history(@invalid_attrs)
    end

    test "update_history/2 with valid data updates the history" do
      history = history_fixture()
      update_attrs = %{}

      assert {:ok, %History{} = history} = Sensor.update_history(history, update_attrs)
    end

    test "update_history/2 with invalid data returns error changeset" do
      history = history_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensor.update_history(history, @invalid_attrs)
      assert history == Sensor.get_history!(history.id)
    end

    test "delete_history/1 deletes the history" do
      history = history_fixture()
      assert {:ok, %History{}} = Sensor.delete_history(history)
      assert_raise Ecto.NoResultsError, fn -> Sensor.get_history!(history.id) end
    end

    test "change_history/1 returns a history changeset" do
      history = history_fixture()
      assert %Ecto.Changeset{} = Sensor.change_history(history)
    end
  end

  describe "auth" do
    alias SensorDashboard.Sensor.Auth

    import SensorDashboard.SensorFixtures

    @invalid_attrs %{}

    test "list_auth/0 returns all auth" do
      auth = auth_fixture()
      assert Sensor.list_auth() == [auth]
    end

    test "get_auth!/1 returns the auth with given id" do
      auth = auth_fixture()
      assert Sensor.get_auth!(auth.id) == auth
    end

    test "create_auth/1 with valid data creates a auth" do
      valid_attrs = %{}

      assert {:ok, %Auth{} = auth} = Sensor.create_auth(valid_attrs)
    end

    test "create_auth/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensor.create_auth(@invalid_attrs)
    end

    test "update_auth/2 with valid data updates the auth" do
      auth = auth_fixture()
      update_attrs = %{}

      assert {:ok, %Auth{} = auth} = Sensor.update_auth(auth, update_attrs)
    end

    test "update_auth/2 with invalid data returns error changeset" do
      auth = auth_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensor.update_auth(auth, @invalid_attrs)
      assert auth == Sensor.get_auth!(auth.id)
    end

    test "delete_auth/1 deletes the auth" do
      auth = auth_fixture()
      assert {:ok, %Auth{}} = Sensor.delete_auth(auth)
      assert_raise Ecto.NoResultsError, fn -> Sensor.get_auth!(auth.id) end
    end

    test "change_auth/1 returns a auth changeset" do
      auth = auth_fixture()
      assert %Ecto.Changeset{} = Sensor.change_auth(auth)
    end
  end
end
