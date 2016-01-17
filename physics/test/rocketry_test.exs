defmodule RocketryTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "escape velocity of earth" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "escape velocity of mars" do
      assert Physics.Rocketry.escape_velocity(:mars) == 5.1
  end

  test "escape velocity of moon" do
        assert Physics.Rocketry.escape_velocity(:moon) == 2.4
    end

  test "escape velocity of unknown planet" do
    assert Physics.Rocketry.escape_velocity(%{mass: 1.0e10, radius: 5.0e5}) == 0.1
  end

  test "need to provide a map for a planet other than Earth to calculate escape velocity" do
    assert_raise FunctionClauseError, fn ->
        Physics.Rocketry.escape_velocity(:unknown)
    end
  end

  test "orbital acceleration of earth" do
      assert Physics.Rocketry.orbital_acceleration(100) == 9.6
  end

  test "orbital term at 100 km of earth" do
    assert Physics.Rocketry.orbital_term(100) == 1.5
  end

  test "calculate height to 4 hours orbital term of earth" do
    assert Physics.Rocketry.height_for_orbital_term(4) == 4489.3
  end

end
