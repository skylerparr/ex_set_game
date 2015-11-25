defmodule SetGame.CardMatches do
  alias SetGame.Deck.Card

  def match?(cards) do
    cards |> Enum.map(&to_tuple/1) |> Enum.sort |> eval
  end

  defp to_tuple(%Card{number: number, symbol: symbol, shading: shading, color: color}) do
    {number, symbol, shading, color}
  end

  # same numbers
  defp eval([{a, _, _, _}, {a, _, _, _}, {a, _, _, _}]), do: true
  # unique numbers
  defp eval([{a, _, _, _}, {b, _, _, _}, {c, _, _, _}]) when a != b and b != c and a != c, do: true
  # same symbols
  defp eval([{_, a, _, _}, {_, a, _, _}, {_, a, _, _}]), do: true
  # unique symbols
  defp eval([{_, a, _, _}, {_, b, _, _}, {_, c, _, _}]) when a != b and b != c and a != c, do: true
  # same shading
  defp eval([{_, _, a, _}, {_, _, a, _}, {_, _, a, _}]), do: true
  # unique shading
  defp eval([{_, _, a, _}, {_, _, b, _}, {_, _, c, _}]) when a != b and b != c and a != c, do: true
  # same color
  defp eval([{_, _, _, a}, {_, _, _, a}, {_, _, _, a}]), do: true
  # unique color
  defp eval([{_, _, _, a}, {_, _, _, b}, {_, _, _, c}]) when a != b and b != c and a != c, do: true

  # no sets
  defp eval([{_, _, _, _}, {_, _, _, _}, {_, _, _, _}]), do: false
end
