defmodule Tame do
  @moduledoc """
  Documentation for `Tame`.
  """
  alias Phoenix.HTML.Tag

  def meta_tags(attribute_list) do
    Enum.map(attribute_list, fn attribute -> attribute |> meta_tag end)
  end

  def meta_tag(attributes) do
    Tag.tag(:meta, Enum.into(attributes, []))
  end
end
