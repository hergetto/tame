defmodule Tame do
  use Supervisor
  alias Tame.MetaTags

    def start_link(_opts) do
      Supervisor.start_link(__MODULE__, :ok)
    end

    # def start_meta_tags_generator(attribute_list) do
    #   spec = { MetaTags, {attribute_list} }
    #   Supervisor.start_child(__MODULE__, spec)
    # end

    # def start_supervisor(attribute_list) do
    #   case start_meta_tags_generator(attribute_list) do
    #     {:ok, pid} -> pid |> GenServer.call(:meta_tags)
    #     {:error, error} -> IO.inspect(error)
    #   end
    # end

    @impl true
    def init(:ok) do
      children = [MetaTags]
      Supervisor.init(children, strategy: :one_for_one)
    end

end
