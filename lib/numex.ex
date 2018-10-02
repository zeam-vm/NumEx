# defmodule Point do
#   defstruct x: [], y: []
# end

defmodule Vector do

  require Math

  defstruct x: [], y: []
  # defstruct %Point{x: [], y: []}

  # @type term :: any
  @type vector(x, y) :: %Vector{x: x, y: y}
  @type vector :: %Vector{x: list, y: list}
  
  @doc """
  ## Examples
    iex> Numex.add([[1, 2], [3, 4]], [[5, 6], [7, 8]])
   [[6,8],[10,12]]
   """

   @spec new(list) :: vector
   def new(data) do
    case data |> is_list do
      true  -> %Vector{x: data} 
      false -> %Vector{x: [data]}   
    end
  end

  # def new(num) when is_integer(num) 

  def nrm(%Vector{x: x} ) do
    x |> nrm
  end

  def nrm(x) when is_list(x) do
    x
    |>Enum.map( &(&1 * &1))
    |>Enum.sum
    |>Math.sqrt
  end 

  def normal(%Vector{x: x} ) when x != [] do
    n = x |> nrm
    x
    |> Enum.map( &(&1/n) )
  end
end

defmodule Bezier do
  # this line is Numerical formula { (1-t) + t }^3
  def bernstain(t, dim\\0) when is_number(t) do
    case dim do
      0 -> [
        (1 - t) |> Math.pow(3), 
        3 * Math.pow(1-t, 2) * t,
        3 * (1-t) * t * t,
        t * t * t
        ]
      1 -> [
        
      ]
      end
    end
end

defmodule Numex do
  @moduledoc """
  Documentation for Numex.
  """

  @doc """
  new matrix

  ## Example
  iex> Numex.new([1, 2, 3])
  """

  def zeros_ex(n) when n < 1, do: []
  def zeros_ex(n) do
    [0] ++ zeros(n-1)
  end

  def new_ex(e1, e2) when e1 > e2, do: []
  def new_ex(e1, e2) do
    [e1] ++ new(e1+1, e2)
  end

  def dot_product_ex(r1, _r2) when r1 == [], do: 0
  def dot_product_ex(r1, r2) do
    [h1|t1] = r1
    [h2|t2] = r2
    (h1*h2) + dot_product_ex(t1, t2)
  end

  # 要素ごとの加算
  def add([a|tla], [b|tlb]) when is_number(a) do
    [a+b|add(tla, tlb)]
  end

  def add([a|tla], [b|tlb]) when is_list(a) do
    [add(a,b)|add(tla, tlb)]
  end

  # def ([], []), do: []
  
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
