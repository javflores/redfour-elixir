defmodule Calcs do
    def to_km(velocity) do
        velocity / 1000
    end

    def to_nearest_tenth(val) do
        Float.ceil(val, 1)
    end

    def square_root(val) do
        :math.sqrt(val)
    end

    def cubed_root(val) do
        :math.pow(val, 0.33)
    end

    def squared(val) do
        val * val
    end

    def cubed(val) do
        :math.pow(val, 3)
    end

    def seconds_to_hours(time) do
        time / 3600
    end

    def to_seconds(time) do
        time * 3600
    end

    def to_m(distance) do
        distance * 1000
    end
end