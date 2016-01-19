defmodule Solar do
	def power(flares) when is_list(flares) do
		flares |> Enum.map(&power(&1))
	end

	def power(%{classification: :X, scale: scale}), do: scale * 1000

	def power(%{classification: :M, scale: scale}), do: scale * 10

	def power(%{classification: :C, scale: scale}), do: scale

end