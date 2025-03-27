# SensorDashboard

A Phoenix LiveView application for monitoring real-time sensor data from ESP32 devices. Tracks temperature, humidity, CO₂, and light intensity from multiple distributed nodes.

---

## Getting Started

1. Install dependencies:

    ```bash
    mix setup
    ```

2. Start the Phoenix server:

    ```bash
    mix phx.server
    ```

3. Visit the app in your browser: [http://localhost:4000](http://localhost:4000)

---

## System Architecture

The following diagram illustrates how sensor data flows through the system:

![Sensor System Diagram](priv/static/images/diagram.png)

---

## Notes

- This app uses LiveView for real-time updates.
- Sensors communicate via MQTT (planned), allowing for distributed and secure data collection.
- Future enhancements: historical data storage, alerting, and sensor calibration controls.

---

## Development

Ensure the following is set in your environment (for dev):

```bash
export DEV_SECRET_KEY_BASE=your-secret-key
