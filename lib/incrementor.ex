defmodule Incrementor do
  use Application

  def start(_type, _args) do
    { :ok, _pid } = Incrementor.Supervisor.start_link(123)
  end
end
