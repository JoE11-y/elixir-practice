defmodule Stats.CentralTendency.Mean do
  # sum (sigma) / count
  alias Stats.{Errors, Validators}

  @spec population_mean([number()]) :: number() | {atom(), String.t()}
  def population_mean(nums) do
    nums
      |> Validators.validate_num_list()
      |> calc_population_mean()
  end

  defp calc_population_mean({false, _}), do: Errors.invalid_data_types()
  defp calc_population_mean({true, nums}) do
    nums
      |> Enum.sum()
      |> mean(Enum.count(nums))
  end
  defp calc_population_mean({:error, _msg}), do: Errors.invalid_data_types()

  defp mean(sigma, count), do: sigma / count
end
