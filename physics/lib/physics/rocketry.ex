defmodule Physics.Rocketry do

    import Calcs
    import Physics.Laws
    import Planets

    def orbital_speed(height) do
        newtons_gravitational_constant * earth.mass / orbital_radius(height)
            |> square_root
    end

    def orbital_acceleration(height) do
      (orbital_speed(height)
      |> squared) / orbital_radius(height)
      |> to_nearest_tenth
    end

    def orbital_term(height) do
      4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * earth.mass)
        |> square_root
        |> seconds_to_hours
        |> to_nearest_tenth
    end

    def height_for_orbital_term(term) do
        (newtons_gravitational_constant * earth.mass * (term |> to_seconds |> squared)) / (4 * (:math.pi |> squared))
            |> cubed_root
            |> take_out_planet_radius
            |> to_km
            |> to_nearest_tenth
    end

    def take_out_planet_radius(orbital_radius) do
        orbital_radius - earth.radius
    end

    defp orbital_radius(height) do
        earth.radius + (height |> to_m)
    end

    def escape_velocity(:earth) do
        earth
            |> escape_velocity
    end

    def escape_velocity(:mars) do
       mars
            |> escape_velocity
    end

    def escape_velocity(:moon) do
       moon
            |> escape_velocity
    end

    def escape_velocity(planet) when is_map(planet) do
        planet
            |> calculate_escape
            |> to_km
            |> to_nearest_tenth
    end

    defp calculate_escape(%{mass: mass, radius: radius}) do
        2 * newtons_gravitational_constant * mass / radius
            |> square_root
    end
end

