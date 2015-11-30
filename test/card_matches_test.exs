defmodule SetGame.CardMatchesTest do
  use ExUnit.Case
  alias SetGame.Deck.Card
  alias SetGame.CardMatches

  doctest CardMatches

  test "should be considered set if all 3 cards have unique numbers" do
    cards = [
      %Card{number: :one, symbol: :diamond, shading: :solid, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :green},
      %Card{number: :three, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be considered a set if all 3 cards have the same numbers" do
    cards = [
      %Card{number: :one, symbol: :diamond, shading: :solid, color: :red},
      %Card{number: :one, symbol: :squiggle, shading: :striped, color: :green},
      %Card{number: :one, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all 3 cards have the same symbols" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :solid, color: :red},
      %Card{number: :two, symbol: :oval, shading: :solid, color: :red},
      %Card{number: :one, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all 3 cards have unique symbols" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :solid, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :striped, color: :green},
      %Card{number: :one, symbol: :squiggle, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all 3 cards have the same shading" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :green},
      %Card{number: :one, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all 3 cards have unique shading" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :striped, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :solid, color: :green},
      %Card{number: :one, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all 3 cards have the same color" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :red},
      %Card{number: :one, symbol: :oval, shading: :solid, color: :red}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all 3 cards have unique color" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :green},
      %Card{number: :one, symbol: :oval, shading: :solid, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should not be a set if no other conditions are met" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :green},
      %Card{number: :one, symbol: :oval, shading: :solid, color: :green}
    ]
    assert CardMatches.match?(cards) == false

  end

end
