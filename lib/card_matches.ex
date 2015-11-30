defmodule SetGame.CardMatches do
  alias SetGame.Deck.Card

  def match?(cards) do
    cards |> Enum.map(&to_tuple/1) |> eval
  end

  defp to_tuple(%Card{number: number, symbol: symbol, shading: shading, color: color}) do
    {number, symbol, shading, color}
  end

  # incorrect sets
  defp eval([{a, _, _, _}, {a, _, _, _}, {b, _, _, _}]) when a != b, do: false
  defp eval([{a, _, _, _}, {b, _, _, _}, {a, _, _, _}]) when a != b, do: false
  defp eval([{b, _, _, _}, {a, _, _, _}, {a, _, _, _}]) when a != b, do: false
  defp eval([{_, a, _, _}, {_, a, _, _}, {_, b, _, _}]) when a != b, do: false
  defp eval([{_, a, _, _}, {_, b, _, _}, {_, a, _, _}]) when a != b, do: false
  defp eval([{_, b, _, _}, {_, a, _, _}, {_, a, _, _}]) when a != b, do: false
  defp eval([{_, _, a, _}, {_, _, a, _}, {_, _, b, _}]) when a != b, do: false
  defp eval([{_, _, a, _}, {_, _, b, _}, {_, _, a, _}]) when a != b, do: false
  defp eval([{_, _, b, _}, {_, _, a, _}, {_, _, a, _}]) when a != b, do: false
  defp eval([{_, _, _, a}, {_, _, _, a}, {_, _, _, b}]) when a != b, do: false
  defp eval([{_, _, _, a}, {_, _, _, b}, {_, _, _, a}]) when a != b, do: false
  defp eval([{_, _, _, b}, {_, _, _, a}, {_, _, _, a}]) when a != b, do: false
  # everything else is valid
  defp eval([{_, _, _, _}, {_, _, _, _}, {_, _, _, _}]), do: true
end
