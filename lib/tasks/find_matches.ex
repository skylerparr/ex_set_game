defmodule Mix.Tasks.FindMatches do
  use Mix.Task

  def run(_) do
    Deck.new |> find_matches
  end

  defp find_matches(cards) do
    
  end
end
