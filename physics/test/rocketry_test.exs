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
end
