defmodule MyEnumTest do
  use ExUnit.Case
  doctest MyEnum

  setup_all do
    { :ok, [ list: [4, 5, 6, 7, 8] ] }
  end

  test "#all? returns true if the given `func` evaluates to true on any of the list items", %{ list: list } do
    assert MyEnum.all?(list, &(&1 > 3))
    assert MyEnum.all?([], &(&1 > 3)) # the same behaviour of `Enum.all/2`
  end

  test "#filter returns only those elements for which `func` returns a truthy value.", %{ list: list } do
    assert MyEnum.filter(list, &(&1 > 5)), [6, 7, 8]
    assert MyEnum.filter([], &(&1 > 5)), []
  end

  test "#each invokes the given `func` for each item in the enumerable.", %{ list: list } do
    !assert MyEnum.each(list, &(&1)), []
    assert MyEnum.each([], &(&1)), []
  end
end