defmodule Gateway.Endpoint do
  use Phoenix.Endpoint, otp_app: :gateway

  plug Plug.Static,
    at: "/", from: :gateway

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_gateway_key",
    signing_salt: "Zu3hWozr",
    encryption_salt: "kypFkh0T"

  plug :router, Gateway.Router
end
