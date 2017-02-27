defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _), do: :ok
  def each([head], func), do: func.(head)
  def each([head | tail], func) do
    func.(head)

    each tail, func
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def split([], _), do: { [], [] }
  def split(list, at) when at < 0 do
    _split(list, [], length(list) - -(at))
  end
  def split(list, at), do: _split(list, [], at)

  defp _split([], left, _),    do: { reverse(left), [] }
  defp _split(right, left, 0), do: { reverse(left), right }
  defp _split([ head | tail ], left, at) do
    _split(tail, [ head | left ], at-1)
  end

  def take([], _), do: []
  def take(_, 0),  do: []
  def take([ head | tail ], at), do: [ head | take(tail, at-1) ]

  def reverse([]), do: []
  def reverse([ _head | _tail ] = list), do: _reverse(list, [])

  defp _reverse([], new), do: new
  defp _reverse([ head | tail ], new), do: _reverse(tail, [ head | new ])
end
