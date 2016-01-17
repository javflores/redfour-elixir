defmodule Physics.Rocketry do

    import Calcs
    import Physics.Laws
    import Planets

    def orbital_speed(height), do: orbital_speed(earth, height)
    def orbital_speed(:mars, height), do: orbital_speed(mars, height)
    def orbital_speed(:moon, height), do: orbital_speed(mars, height)
    def orbital_speed(:earth, height), do: orbital_speed(mars, height)

    def orbital_speed(planet, height) do
       newtons_gravitational_constant * planet.mass / orbital_radius(planet, height)
            |> square_root
    end

    def orbital_acceleration(:earth, height), do: orbital_acceleration(earth, height)

    def orbital_acceleration(planet, height) do
      (orbital_speed(height)
      |> squared) / orbital_radius(planet, height)
      |> to_nearest_tenth
    end

    def orbital_term(height), do: orbital_term(earth, height)
    def orbital_term(:earth, height), do: orbital_term(earth, height)
    def orbital_term(:moon, height), do: orbital_term(moon, height)
    def orbital_term(:mars, height), do: orbital_term(mars, height)

    def orbital_term(planet, height) do
      4 * (:math.pi |> squared) * (orbital_radius(planet, height) |> cubed) / (newtons_gravitational_constant * planet.mass)
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

    defp orbital_radius(planet, height) do
        planet.radius + (height |> to_m)
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

