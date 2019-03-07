defmodule Geometry do
  @moduledoc """
  Documentation for Geometry.
  """

  @doc """
  First, given two points called point A and point B.
  Calculate Equilateral Triangle with following algorithm:compared only distance for point A , point B.and point C.
  not using middle point for point A, point B.

  ## Examples
      iex> Geometry.mkEquilateralTriangle Point.new(1, 0), Point.new(0, 0)
      [
      %Point{x: 0.5000000010362837, y: 0.8660254031861399},
      %Point{x: 0.5000000010362837, y: -0.8660254031861399}
      ]
  """

  # def mkEquilateralTriangle([t1, t2]) do 
  #   mkEquilateralTriangle(t1, t2)
  # end

  @spec mkEquilateralTriangle(Point.t(), Point.t()) :: [Point.t()]
  def mkEquilateralTriangle(t1, t2) do
    [p1, p2] = Point.new_sort(t1, t2)
    dist = Point.nrm(p1, p2)
    %Point{x: x1, y: y1} = p1
    %Point{x: x2, y: y2} = p2

    x_delta = x2-x1
    y_delta = y2-y1

    ratio = 1.0

    init_angle = 
    if x_delta != 0 do
      Math.atan(y_delta / x_delta)
      |>Kernel./(Math.pi)
      |>Kernel.*(180)
    else
      90
    end

    move = 1..1000
      |> Enum.to_list
      |> Enum.map( &(&1 / 1000))
      |> Enum.reverse

    IO.puts dist

    angle = 
    move
    |> Enum.reduce( 0, fn accuracy, angle -> 
      rad = (angle)*Math.pi/180
      p = %Point{
        x: dist*Math.cos(rad), 
        y: dist*Math.sin(rad)
      }

      dist_BP = Point.nrm(p, Point.new(dist, 0))

      # IO.puts dist_BP
      IO.puts angle

      if(dist_BP != 0) do
        dist_ratio = dist / dist_BP
        if( abs( dist_ratio - ratio ) < 1.0e-6 ) do
          angle
        else
          if dist_ratio > ratio do
            angle + accuracy
          else
            angle - accuracy / 10
          end
        end
      else
        angle + accuracy
      end
    end)

    IO.puts "init_angle:#{init_angle}"
    IO.puts "angle:#{angle}"
    rad1 = (init_angle + angle)*3.14159265/180
    rad2 = - (angle - init_angle)*3.14159265/180

    [ Point.new(x1 + dist*Math.cos(rad1), y1 + dist*Math.sin(rad1)) ,
      Point.new(x1 + dist*Math.cos(rad2), y1 + dist*Math.sin(rad2)) 
    ]
  end
end
