defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median, Mode}

  defdelegate population_mean(num_list), to: Mean

  defdelegate median(num_list), to: Median

  defdelegate mode(num_list), to: Mode
end
