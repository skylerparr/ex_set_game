defmodule Mix.Tasks.ProcessMany do
  use Mix.Task

  def run(args) do
    number_of_games = args |> hd |> String.to_integer
    list = for n <- 1..number_of_games, do: n
    tasks = run_game(list, [])
    Enum.each(tasks, fn(task) -> 
      matches = Task.await(task)
      if matches != [] do
        IO.inspect matches
      end
    end)
  end

  defp run_game([], ret_val), do: ret_val
  defp run_game(items, ret_val) do
    ret_val = ret_val ++ [Task.async(&play_game/0)]
    run_game(items |> tl, ret_val)
  end

  defp play_game do
    :timer.sleep(100)
    SetGame.play
  end

end
