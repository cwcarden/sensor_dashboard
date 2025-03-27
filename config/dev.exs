import Config

# Configure your database
config :sensor_dashboard, SensorDashboard.Repo,
  username: System.get_env("PG_DEV_USERNAME") || raise("PG_DEV_USERNAME not set"),
  password: System.get_env("PG_DEV_PASSWORD") || raise("PG_DEV_PASSWORD not set"),
  hostname: System.get_env("PG_DEV_HOST") || raise("PG_DEV_HOST not set"),
  database: System.get_env("PG_DEV_DATABASE") || raise("PG_DEV_DATABASE not set"),
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Endpoint configuration
config :sensor_dashboard, SensorDashboardWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: System.get_env("DEV_SECRET_KEY_BASE") || raise("DEV_SECRET_KEY_BASE not set"),
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:sensor_dashboard, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:sensor_dashboard, ~w(--watch)]}
  ]

# Live reload configuration
config :sensor_dashboard, SensorDashboardWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/sensor_dashboard_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :sensor_dashboard, dev_routes: true
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

config :swoosh, :api_client, false
