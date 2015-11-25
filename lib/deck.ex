defmodule SetGame.Deck do
  
  defmodule Card do
    defstruct [:number, :symbol, :shading, :color]
  end

  def new do
    for number <- numbers, symbol <- symbols, shading <- shadings, color <- colors do
      %Card{number: number, symbol: symbol, shading: shading, color: color}
    end |> Enum.shuffle
  end

  defp numbers, do: [:one, :two, :three]
  defp symbols, do: [:diamond, :squiggle, :oval]
  defp shadings, do: [:solid, :striped, :open]
  defp colors, do: [:red, :green, :purple]
end
