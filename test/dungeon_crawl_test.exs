defmodule RPGTest do
  use ExUnit.Case
  doctest RPG

  test "greets the world" do
    assert RPG.hello() == :world
  end
end
