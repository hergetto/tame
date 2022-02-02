defmodule TameTest do
  use ExUnit.Case
  doctest Tame

  test "greets the world" do
    assert Tame.hello() == :world
  end
end
