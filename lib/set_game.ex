defmodule SetGame do
  alias SetGame.Deck
  alias SetGame.CardMatches
  
  def play do
    Deck.new |> find_matches([]) |> IO.inspect
  end

  defp find_matches([], ret_val), do: ret_val
  defp find_matches(cards, ret_val) do
    top_three = cards |> Enum.slice(0, 3)
    if CardMatches.match?(top_three) do
      ret_val = (ret_val ++ [top_three])
    end
    find_matches(cards |> Enum.drop(3), ret_val)
  end

end
