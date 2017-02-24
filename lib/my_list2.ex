defmodule MyList2 do
  def all?([head], func), do: func.(head)
  def all?([head | tail], func) do
    if func.(head), do: all?(tail, func), else: false
  end

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
end
