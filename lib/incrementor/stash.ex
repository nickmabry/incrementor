defmodule Incrementor.Stash do
  use GenServer

  def start_link(initial_number) do
    GenServer.start_link(__MODULE__, initial_number, name: __MODULE__, debug: [:trace])
  end

  def get_value(pid) do
    GenServer.call(pid, :get_value)
  end

  def save_value(pid, new_value) do
    GenServer.cast(pid, { :save_value, new_value })
  end

  # GenServer Implementation
  def handle_call(:get_value, _from, current_value) do
    { :reply, current_value, current_value }
  end

  def handle_cast({ :save_value, new_value }, _current_value) do
    { :noreply, new_value }
  end
end
