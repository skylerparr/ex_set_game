defmodule SetGame.CardMatchesTest do
  use ExUnit.Case
  alias SetGame.Deck.Card
  alias SetGame.CardMatches

  doctest CardMatches

  test "should not be considered set if only 2 symbols are matched" do
    cards = [
      %Card{number: :one, symbol: :diamond, shading: :solid, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :green},
      %Card{number: :three, symbol: :oval, shading: :striped, color: :purple}
    ]
    assert CardMatches.match?(cards) == false
  end

  test "should not be considered a set if only 2 numbers are matched" do
    cards = [
      %Card{number: :one, symbol: :diamond, shading: :solid, color: :red},
      %Card{number: :one, symbol: :squiggle, shading: :striped, color: :green},
      %Card{number: :three, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards) == false
  end

  test "should not be considered a set if only 2 shades are matched" do
    cards = [
      %Card{number: :one, symbol: :diamond, shading: :solid, color: :green},
      %Card{number: :two, symbol: :oval, shading: :solid, color: :red},
      %Card{number: :three, symbol: :squiggle, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards) == false
  end

  test "should not be considered a set if only 2 colors are matched" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :solid, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :striped, color: :green},
      %Card{number: :three, symbol: :squiggle, shading: :open, color: :red}
    ]
    assert CardMatches.match?(cards) == false
  end

  test "should be consided a set if all numbers are different and other are the same" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :oval, shading: :open, color: :red},
      %Card{number: :three, symbol: :oval, shading: :open, color: :red}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all symbols are different and others are the same" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :one, symbol: :diamond, shading: :open, color: :red},
      %Card{number: :one, symbol: :squiggle, shading: :open, color: :red}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all shading are different and others are the same" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :striped, color: :red},
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :one, symbol: :oval, shading: :solid, color: :red}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all colors are different and others are the same" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :one, symbol: :oval, shading: :open, color: :green},
      %Card{number: :one, symbol: :oval, shading: :open, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be consided a set if all are different" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :solid, color: :green},
      %Card{number: :three, symbol: :squiggle, shading: :striped, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be considered a set if all are the same" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :one, symbol: :oval, shading: :open, color: :red}
    ]
    assert CardMatches.match?(cards)
  end

  test "should be considered a set if numbers and symbols are the same and shading and color are different" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :one, symbol: :oval, shading: :solid, color: :green},
      %Card{number: :one, symbol: :oval, shading: :striped, color: :purple}
    ]
    assert CardMatches.match?(cards)
  end

  test "should not be a set if any 2 types only have 2 cards that match" do
    cards = [
      %Card{number: :one, symbol: :oval, shading: :open, color: :red},
      %Card{number: :two, symbol: :diamond, shading: :open, color: :green},
      %Card{number: :one, symbol: :oval, shading: :solid, color: :green}
    ]
    assert CardMatches.match?(cards) == false

  end

end
