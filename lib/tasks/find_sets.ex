defmodule Mix.Tasks.FindSets do
  use Mix.Task

  def run(_) do
    matches = SetGame.play
    Enum.each(matches, fn(match) ->
      IO.inspect match
    end)
  end

end
