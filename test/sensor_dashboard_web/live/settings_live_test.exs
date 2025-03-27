defmodule SensorDashboardWeb.SettingsLiveTest do
  use SensorDashboardWeb.ConnCase

  import Phoenix.LiveViewTest
  import SensorDashboard.SensorFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_settings(_) do
    settings = settings_fixture()
    %{settings: settings}
  end

  describe "Index" do
    setup [:create_settings]

    test "lists all settings", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/settings")

      assert html =~ "Listing Settings"
    end

    test "saves new settings", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/settings")

      assert index_live |> element("a", "New Settings") |> render_click() =~
               "New Settings"

      assert_patch(index_live, ~p"/settings/new")

      assert index_live
             |> form("#settings-form", settings: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#settings-form", settings: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/settings")

      html = render(index_live)
      assert html =~ "Settings created successfully"
    end

    test "updates settings in listing", %{conn: conn, settings: settings} do
      {:ok, index_live, _html} = live(conn, ~p"/settings")

      assert index_live |> element("#settings-#{settings.id} a", "Edit") |> render_click() =~
               "Edit Settings"

      assert_patch(index_live, ~p"/settings/#{settings}/edit")

      assert index_live
             |> form("#settings-form", settings: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#settings-form", settings: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/settings")

      html = render(index_live)
      assert html =~ "Settings updated successfully"
    end

    test "deletes settings in listing", %{conn: conn, settings: settings} do
      {:ok, index_live, _html} = live(conn, ~p"/settings")

      assert index_live |> element("#settings-#{settings.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#settings-#{settings.id}")
    end
  end

  describe "Show" do
    setup [:create_settings]

    test "displays settings", %{conn: conn, settings: settings} do
      {:ok, _show_live, html} = live(conn, ~p"/settings/#{settings}")

      assert html =~ "Show Settings"
    end

    test "updates settings within modal", %{conn: conn, settings: settings} do
      {:ok, show_live, _html} = live(conn, ~p"/settings/#{settings}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Settings"

      assert_patch(show_live, ~p"/settings/#{settings}/show/edit")

      assert show_live
             |> form("#settings-form", settings: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#settings-form", settings: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/settings/#{settings}")

      html = render(show_live)
      assert html =~ "Settings updated successfully"
    end
  end
end
