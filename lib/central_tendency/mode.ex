defmodule Stats.CentralTendency.Mode do
  require Integer
  alias Stats.{Errors, Validators}

  def mode(num_list) do
    num_list
    |> Validators.validate_num_list()
    |> calc_mode
  end

  defp calc_mode({:error, _msg}), do: Errors.invalid_data_types()
  defp calc_mode({false, _}), do: Errors.invalid_data_types()
  defp calc_mode({true, num_list}) do
    ranked_map = num_list |> Enum.frequencies()
    ranked_map
      |> Map.values()
      |> Enum.max()
      |> get_mode(ranked_map)
  end

  defp get_mode(1, _ranked_map), do: nil

  defp get_mode(max, ranked_map) do
    ranked_map
      |> Map.filter(fn {_key, value} -> value == max end)
      |> Map.keys()
  end

end
