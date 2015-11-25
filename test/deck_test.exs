defmodule SetGame.DeckTest do
  use ExUnit.Case
  alias SetGame.Deck

  doctest Deck

  test "should generate deck" do
    assert 81 == Deck.new |> Enum.count
  end
end
