defmodule Point do
  @moduledoc """
  This module uses two-dimentional coordinates in Cartesian coordinate system.
  """

  defstruct x: 0, y: 0, z: 0
  @typedoc """
      Type that represents Point struct with :x and :y as number.  
      Pointを表す型は:xを数値型、:yを数値型として取る構造体を表す。
  """

  @type t(x) :: %Point{x: x, y: 0, z: 0}
  @type t(x, y) :: %Point{x: x, y: y, z: 0}
  @type t(x, y, z) :: %Point{x: x, y: y, z: z}
  @type t:: %Point{x: float, y: float, z: float}

  require Math

  @doc """
    new vector from a number
  ## Examples
      iex> Point.new(1)
      %Point{x: 1, y: 0, z: 0}
  """
  @spec new(number) :: Point.t()
  def new(a), do: %Point{x: a}

  @doc """
    new vector from two number
  ## Examples
      iex> Point.new(1, 1)
      %Point{x: 1, y: 1}
  """
  @spec new(number, number) :: Point.t()
  def new(a, b), do: %Point{x: a, y: b}

  @doc """
    new vector from three number
  ## Examples
      iex> Point.new(1, 1)
      %Point{x: 1, y: 1}
  """
  @spec new(number, number, number) :: Point.t()
  def new(a, b, c), do: %Point{x: a, y: b}

  @doc """
    new vector from two vector and sort.  
    output a is near by origin than b.
  ## Examples
      iex> Point.new_sort( Point.new(1, 0), Point.new(0, 0))
      [%Point{x: 0, y: 0}, %Point{x: 1, y: 0}]
  """
  @spec new_sort(Point.t(), Point.t()) :: [Point.t()]
  def new_sort(a, b) do
    sort(a, b)
  end
  @doc """
    Calculate Vector from two vector.

  ## Examples
      iex> Point.new_vector( %Point{x: 2, y: 2}, %Point{x: 1, y: 1} )
      %Point{x: 1, y: 1}
  """
  @spec new_vector(Point.t(), Point.t()) :: Point.t()
  # def new_vector(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
  def new_vector(a, b) do
    # %Point{x: b.x - a.x, y: b.y - a.y}
    [a, b] = sort(a, b)
    sub(a, b)
  end

  @spec sort(Point.t(), Point.t()) :: [Point.t()]
  defp sort(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
    if x1 < x2 do
      [%Point{x: x1, y: y1}, %Point{x: x2, y: y2}]
    else
      [%Point{x: x2, y: y2}, %Point{x: x1, y: y1}]
    end
  end

   @doc """
    Subtract Vector from two vector.

  ## Examples
      iex> Point.sub( %Point{x: 2, y: 2}, %Point{x: 1, y: 1} )
      %Point{x: -1, y: -1}
  """
  @spec sub(Point.t(), Point.t()) :: Point.t()
  def sub(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
    new(x2 - x1, y2 - y1)
  end
  
  @doc """
    Calculate norum of "one" vector

  ## Examples
      iex> Point.nrm(Point.new(1, 1))
      1.4142135623730951
  """
  @spec nrm(Point.t()) :: float
  def nrm(%Point{x: x, y: y}) do
    (x*x + y*y)
    |> Math.sqrt
  end

  @doc """
    Calculate norum of "two" vector

  ## Examples
      iex> Point.nrm(Point.new(0, 0), Point.new(1, 1))
      1.4142135623730951
  """
  @spec nrm(Point.t(), Point.t()) :: float
  def nrm(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
    Math.pow((x1 - x2) , 2) + Math.pow(y1 - y2, 2)
    |> Math.sqrt
  end 

  # @spec unit(Point.t()) :: Point.t()
  # def unit(%Point{x: x, y: y}) do
  #   n = nrm(new(x, y))
  #   new( x / n, y / n)
  # end

end
