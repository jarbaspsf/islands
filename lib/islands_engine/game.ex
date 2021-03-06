defmodule IslandsEngine.Game do
  use GenServer

  def handle_info(:first, state) do
    IO.puts "This message has been handdled by handle_info/2, matching on :first"
    {:noreply, state}
  end

  def handle_call(:demo_call, from, state) do
      {:reply, state, state}
  end

  def demo_call(game) do
    GenServer.call(game, :demo_call)
  end

  def handle_cast({:demo_cast, new_value}, state) do
    {:noreply, Map.put(state, :test, new_value)}
  end  

  def demo_call(game, new_value) do
    GenServer.cast(game, {:demo_cast, new_value})
  end
end
