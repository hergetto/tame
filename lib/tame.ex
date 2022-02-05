defmodule Tame do
  use Supervisor
  alias Tame.MetaTags

    def start_link(_opts) do
      Supervisor.start_link(__MODULE__, :ok)
    end

    @impl true
    def init(:ok) do
      children = [MetaTags]
      Supervisor.init(children, strategy: :one_for_one)
    end

end
