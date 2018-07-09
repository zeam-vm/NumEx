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
  def timed(func) do
    func
    |> :timer.tc
    |> elem(0) 
    |> Kernel./(1000000)
  end
  
  def timed_recursive() do
    :timer.tc( fn -> 
      1..10000000 
      |> Enum.to_list 
      |> Numex.twice end )
      |> elem(0) 
      |> Kernel./(1000000)
  end

  def timed_enum() do
    :timer.tc( fn -> 
      1..10000000 
      |> Enum.to_list 
      |> Enum.map(& &1 * 2 ) end )
      |> elem(0) 
      |> Kernel./(1000000)
  end
  
  def timed_flow(stage) do
    :timer.tc(fn -> 
    1..10000000 
    |> Flow.from_enumerable(stages: stage) 
    |> Flow.map(& &1 * 2) 
    |> Enum.to_list end) 
    |> elem(0) 
    |> Kernel./(1000000)
  end

  # 要素ごとの加算
  def add([a|tla], [b|tlb]) when not is_list(a) do
    [a+b|add(tla, tlb)] 
  end

  # 要素ごと2倍
  def twice([a|tla]) when not is_list(a) do
    [2*a|twice( tla)] 
  end
  def twice([]), do: [] 

  def add([a|tla], [b|tlb]) when is_list(a) do
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
