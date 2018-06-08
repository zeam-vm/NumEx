defmodule Numex do
  defstruct list: []
  @moduledoc """
  Documentation for Numex.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Numex.hello
      :world

  """
  def hello do
    :world
  end

  """
  def zeros(list, num) do
    if num != 0 do
      list ++ [zeros(list, num-1)]
    else

    end
  end
  """
  # 要素ごとの加算
  def add([a|tail1], [b|tail2]) do
    [a+b|add(tail1, tail2)] 
  end

  def add([], []), do: []
  
  # 要素ごとの乗算
  # Pointwise product
  def prd([a|tail1], [b|tail2]) do
    [a*b|prd(tail1, tail2)]
  end

  def prd([], []), do: []
  
  def dot([a|tail1],[b|tail2]) do
      
  end

  def dot(num, [], []) , do: []
end

#Numex.add(,[1, 2, 3], [2, 3, 4])
#Numex.prd([1, 2, 3], [4, 5, 6])
