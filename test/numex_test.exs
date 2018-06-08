defmodule NumexTest do
  use ExUnit.Case
  doctest Numex

  test "greets the world" do
    assert Numex.hello() == :world
  end

  test "add like numpy" do
    assert Numex.add([1, 1], [2, 3]) == [3, 4]
  end

  test "prd test" do
    assert Numex.prd([1,2,3],[1,2,3]) == [1, 4, 9]
  end
end
