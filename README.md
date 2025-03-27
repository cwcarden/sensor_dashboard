# SensorDashboard

A Phoenix LiveView application for monitoring real-time sensor data from ESP32 devices.  
Tracks temperature, humidity, CO₂, and light intensity from multiple distributed nodes.

---

## 🚀 Getting Started

1. **Install dependencies**:

    ```bash
    mix setup
    ```

2. **Start the Phoenix server**:

    ```bash
    mix phx.server
    ```

3. **Visit the app in your browser**:  
   [http://localhost:4000](http://localhost:4000)

---

## 🛠 Environment Variables

To keep sensitive info out of source control, use a `.env` file.

### `.env` example:

```bash
# .env
PG_DEV_USERNAME=postgres
PG_DEV_PASSWORD=your_password_here
PG_DEV_HOST=localhost
PG_DEV_DATABASE=sensor_dashboard_dev

DEV_SECRET_KEY_BASE=your_long_secure_key

## System Architecture

The following diagram illustrates how sensor data flows through the system:

![Sensor System Diagram](priv/static/images/diagram.png)