defmodule SensorDashboardWeb.DashboardLive.Index do
  use SensorDashboardWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, :update_sensor_data)
    end

    {:ok,
     assign(socket,
       temperature: "--",
       humidity: "--",
       co2: "--",
       light: "--"
     )}
  end

  def handle_info(:update_sensor_data, socket) do
    socket =
      assign(socket,
        temperature: :rand.uniform(10) + 20,
        humidity: :rand.uniform(40) + 30,
        co2: :rand.uniform(400) + 300,
        light: :rand.uniform(900) + 100
      )

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-2 gap-6 mt-6">
      <div class="bg-white shadow rounded-2xl p-6 text-center">
        <h2 class="text-lg font-semibold text-gray-700">Temperature</h2>
        <p class="text-3xl font-bold text-red-600 mt-2"><%= @temperature %> °C</p>
      </div>
      <div class="bg-white shadow rounded-2xl p-6 text-center">
        <h2 class="text-lg font-semibold text-gray-700">Humidity</h2>
        <p class="text-3xl font-bold text-blue-600 mt-2"><%= @humidity %> %</p>
      </div>
      <div class="bg-white shadow rounded-2xl p-6 text-center">
        <h2 class="text-lg font-semibold text-gray-700">CO₂</h2>
        <p class="text-3xl font-bold text-green-600 mt-2"><%= @co2 %> ppm</p>
      </div>
      <div class="bg-white shadow rounded-2xl p-6 text-center">
        <h2 class="text-lg font-semibold text-gray-700">PPFD</h2>
        <p class="text-3xl font-bold text-yellow-500 mt-2"><%= @light %> µmol/m²/s</p>
      </div>
    </div>
    """
  end
end
