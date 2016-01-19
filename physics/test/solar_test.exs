defmodule SolarTest do
    use ExUnit.Case
    use Timex

    setup do
        flares = [
            %{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
            %{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
            %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
            %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
            %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
            %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
            %{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
            %{classification: :X, scale: 45, date: Date.from({2003, 11, 4})}
        ]
        {:ok, data: flares}
    end

    test "We have 8 solar flares", %{data: flares} do
        assert length(flares) == 8
    end

    test "Get power of solar flares from scales", %{data: flares} do
        powers = flares |> Solar.power
        assert powers == [99000, 58, 12, 3.2, 836, 2.5, 72000, 45000]
    end

    test "Get power of single solar flare with X classification" do
        power = %{classification: :X, scale: 10, date: Date.from({2012, 7, 23})} |> Solar.power
        assert power == 10000
    end


    test "Get power of single solar flare with M classification" do
        power = %{classification: :M, scale: 10, date: Date.from({2012, 7, 23})} |> Solar.power
        assert power == 100
    end

    test "Get power of single solar flare with C classification" do
        power = %{classification: :C, scale: 10, date: Date.from({2012, 7, 23})} |> Solar.power
        assert power == 10
    end

end