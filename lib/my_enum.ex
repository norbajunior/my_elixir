defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _) do
    :ok
  end

  def each([head], func) do
    func.(head)
  end

  def each([head | tail], func) do
    func.(head)

    each tail, func
  end

  def filter([], _) do
    []
  end

  def filter([head | tail], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def split([], _) do
    { [], [] }
  end

  def split(list, at) when at < 0 do
    do_split(list, [], length(list) - -(at))
  end

  def split(list, at) do
    do_split(list, [], at)
  end

  defp do_split([], left, _),    do: { reverse(left), [] }
  defp do_split(right, left, 0), do: { reverse(left), right }
  defp do_split([ head | tail ], left, at) do
    do_split(tail, [ head | left ], at-1)
  end

  def take([], _), do: []
  def take(_, 0),  do: []
  def take([ head | tail ], at), do: [ head | take(tail, at-1) ]

  def reverse([]), do: []
  def reverse([ _head | _tail ] = list), do: do_reverse(list, [])

  defp do_reverse([], new), do: new
  defp do_reverse([ head | tail ], new), do: do_reverse(tail, [ head | new ])

  def flatten([]), do: []
  def flatten([_ | _] = list), do: do_flatten(list, [])

  defp do_flatten([], flattened_list) do
    flattened_list
  end

  defp do_flatten([head | tail], flattened_list) do
    do_flatten head, do_flatten(tail, flattened_list)
  end

  defp do_flatten(x, flattened_list) do
    [ x | flattened_list ]
  end
end
