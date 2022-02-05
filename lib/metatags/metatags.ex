defmodule Tame.MetaTags do
  use GenServer
  alias Phoenix.HTML.Tag

  def start_link(default \\ []) do
    GenServer.start_link(__MODULE__, default)
  end

  def meta_tags(pid, attribute_list) do
    meta_tags = Enum.map(attribute_list, fn attribute -> attribute |> meta_tag end)
    GenServer.call(pid, {:meta_tags, meta_tags})
  end

  def meta_tag(attributes) do
    Tag.tag(:meta, Enum.into(attributes, []))
  end

  @impl true
  def handle_call({:meta_tags, stuff}, _from, state) do
      # meta_tags = meta_tags(state)
      # IO.inspect(stuff)
      {:reply, stuff, state}
  end

  @impl true
  def init(state) do
    {:ok, state}
  end
end
