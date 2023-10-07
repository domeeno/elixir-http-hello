defmodule Hello do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Hello.Router, options: [port: 4000]}
    ]


    Logger.info("Server starting at 4000")
    opts = [strategy: :one_for_one, name: Hello.Application]
    Supervisor.start_link(children, opts)
  end
end
