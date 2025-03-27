defmodule SensorDashboardWeb.LoginLive.Index do
  use SensorDashboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:error, nil)
     |> assign(:username, "")
     |> assign(:password, "")
    }
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-md mx-auto mt-10 bg-white p-8 rounded-xl shadow-md">
      <h2 class="text-2xl font-semibold mb-6">Login</h2>

      <%= if @error do %>
        <p class="text-red-600 mb-4"><%= @error %></p>
      <% end %>

      <.form for={to_form(%{}, as: :login)} phx-submit="login">

        <div class="mb-4">
          <.input
            type="text"
            name="username"
            label="Username"
            value={@username}
            required
          />
        </div>

        <div class="mb-6">
          <.input
            type="password"
            name="password"
            label="Password"
            value={@password}
            required
          />
        </div>

        <.button class="w-full">Log In</.button>
      </.form>
    </div>
    """
  end

  def handle_event("login", %{"username" => username, "password" => password}, socket) do
    if username == "charles" and password == "supersecret" do
      {:noreply,
       push_navigate(socket, to: ~p"/auth/login/success?user_id=charles")}
    else
      {:noreply, put_flash(socket, :error, "Invalid username or password")}
    end
  end


end
