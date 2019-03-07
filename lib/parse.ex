defmodule JSON do
  def parse do
    "model/model.json"
    |> File.read!
    |> Poison.decode!
    # deserialize(config, custom_objects=custom_objects)
  end
end