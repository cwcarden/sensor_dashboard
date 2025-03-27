defmodule SensorDashboardWeb.LogoutLiveTest do
  use SensorDashboardWeb.ConnCase

  import Phoenix.LiveViewTest
  import SensorDashboard.AuthFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_logout(_) do
    logout = logout_fixture()
    %{logout: logout}
  end

  describe "Index" do
    setup [:create_logout]

    test "lists all logout", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/logout")

      assert html =~ "Listing Logout"
    end

    test "saves new logout", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/logout")

      assert index_live |> element("a", "New Logout") |> render_click() =~
               "New Logout"

      assert_patch(index_live, ~p"/logout/new")

      assert index_live
             |> form("#logout-form", logout: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#logout-form", logout: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/logout")

      html = render(index_live)
      assert html =~ "Logout created successfully"
    end

    test "updates logout in listing", %{conn: conn, logout: logout} do
      {:ok, index_live, _html} = live(conn, ~p"/logout")

      assert index_live |> element("#logout-#{logout.id} a", "Edit") |> render_click() =~
               "Edit Logout"

      assert_patch(index_live, ~p"/logout/#{logout}/edit")

      assert index_live
             |> form("#logout-form", logout: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#logout-form", logout: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/logout")

      html = render(index_live)
      assert html =~ "Logout updated successfully"
    end

    test "deletes logout in listing", %{conn: conn, logout: logout} do
      {:ok, index_live, _html} = live(conn, ~p"/logout")

      assert index_live |> element("#logout-#{logout.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#logout-#{logout.id}")
    end
  end

  describe "Show" do
    setup [:create_logout]

    test "displays logout", %{conn: conn, logout: logout} do
      {:ok, _show_live, html} = live(conn, ~p"/logout/#{logout}")

      assert html =~ "Show Logout"
    end

    test "updates logout within modal", %{conn: conn, logout: logout} do
      {:ok, show_live, _html} = live(conn, ~p"/logout/#{logout}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Logout"

      assert_patch(show_live, ~p"/logout/#{logout}/show/edit")

      assert show_live
             |> form("#logout-form", logout: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#logout-form", logout: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/logout/#{logout}")

      html = render(show_live)
      assert html =~ "Logout updated successfully"
    end
  end
end
