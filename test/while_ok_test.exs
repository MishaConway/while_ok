defmodule WhileOkTest do
  use ExUnit.Case
  doctest WhileOk

  test "greets the world" do
    assert WhileOk.hello() == :world
  end
end
