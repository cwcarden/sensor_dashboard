defmodule SensorDashboard.AuthTest do
  use SensorDashboard.DataCase

  alias SensorDashboard.Auth

  describe "logout" do
    alias SensorDashboard.Auth.Logout

    import SensorDashboard.AuthFixtures

    @invalid_attrs %{}

    test "list_logout/0 returns all logout" do
      logout = logout_fixture()
      assert Auth.list_logout() == [logout]
    end

    test "get_logout!/1 returns the logout with given id" do
      logout = logout_fixture()
      assert Auth.get_logout!(logout.id) == logout
    end

    test "create_logout/1 with valid data creates a logout" do
      valid_attrs = %{}

      assert {:ok, %Logout{} = logout} = Auth.create_logout(valid_attrs)
    end

    test "create_logout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_logout(@invalid_attrs)
    end

    test "update_logout/2 with valid data updates the logout" do
      logout = logout_fixture()
      update_attrs = %{}

      assert {:ok, %Logout{} = logout} = Auth.update_logout(logout, update_attrs)
    end

    test "update_logout/2 with invalid data returns error changeset" do
      logout = logout_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_logout(logout, @invalid_attrs)
      assert logout == Auth.get_logout!(logout.id)
    end

    test "delete_logout/1 deletes the logout" do
      logout = logout_fixture()
      assert {:ok, %Logout{}} = Auth.delete_logout(logout)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_logout!(logout.id) end
    end

    test "change_logout/1 returns a logout changeset" do
      logout = logout_fixture()
      assert %Ecto.Changeset{} = Auth.change_logout(logout)
    end
  end
end
