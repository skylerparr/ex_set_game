defmodule SetGame.DeckTest do
  use ExUnit.Case
  alias SetGame.Deck

  doctest Deck

  test "should generate deck" do
    assert 81 == Deck.new |> Enum.count
    deck_a = Deck.new
    deck_b = Deck.new
    assert deck_a != deck_b
  end
end
