defmodule SetGameTest do
  use ExUnit.Case
  doctest SetGame

  test "should find all matches" do
    assert SetGame.play |> Enum.count > 0
    assert SetGame.play |> hd |> Enum.count == 3
  end
end
