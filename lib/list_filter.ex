defmodule ListFilter do
  @moduledoc false
  def call(list) do
    result =
      list
      |> check_number()
      |> odd_list()
      |> Enum.count()

    {:ok, result}
  end

  defp check_number(list) do
    Enum.flat_map(list, fn elem ->
      case Integer.parse(elem) do
        {int, _rest} ->
          [int]

        :error ->
          []
      end
    end)
  end

  defp odd_list(list) do
    new_list =
      Enum.filter(list, fn elem ->
        rem(elem, 2) == 1
      end)

    new_list
  end
end
