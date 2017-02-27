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
  def split(list, count) when count < 0 do
    _split(list, [], length(list) - -(count))
  end
  def split(list, count), do: _split(list, [], count)
  def _split([], left, _), do: { Enum.reverse(left), [] }
  def _split(right, left, 0),     do: { Enum.reverse(left), right }
  def _split([ head | tail ], left, count) do
    _split(tail, [ head | left ], count-1)
  end
end
