defmodule Numex do
  defstruct list: []
  @moduledoc """
  Documentation for Numex.
  """

  @doc """

  ## Examples
    iex> Numex.add([[1, 2], [3, 4]], [[5, 6], [7, 8]])
    [[6,8],[10,12]]
 """

  # 要素ごとの加算
  def add([a|tla], [b|tlb]) when not is_list(a) do
    [a+b|add(tla, tlb)] 
  end

  def add([a|tla], [b|tlb]) when is_list(a) do
   IO.inspect tla, char_lists: :as_lists
   IO.inspect tlb, char_lists: :as_charlists
   [add(a,b)|add(tla, tlb)]
  end

  def add([], []), do: []
  
  # 要素ごとの乗算
  # Pointwise product
  def prd([a|tail1], [b|tail2]) do
    [a*b|prd(tail1, tail2)]
  end
  def prd([], []), do: []
  
  def dot([hda|tla],[hdb|tlb]) do
    (hda*hdb)+dot(tla,tlb)
  end

  def dot([],[]), do: 0

  def sum([hd|tl]) do
   (hd)+sum(tl) 
  end
  def sum([]), do: 0
end
