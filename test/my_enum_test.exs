defmodule MyEnumTest do
  use ExUnit.Case
  doctest MyEnum

  setup_all do
    { :ok, [ list: [4, 5, 6, 7, 8] ] }
  end

  test "#all? elements are greater than 3", %{ list: list } do
    assert MyEnum.all?(list, &(&1 > 3))
    assert MyEnum.all?([], &(&1 > 3)) # the same behaviour of `Enum.all/2`
  end

  test "#filter numbers greater than 5", %{ list: list } do
    assert MyEnum.filter(list, &(&1 > 5)), [6, 7, 8]
    assert MyEnum.filter([], &(&1 > 5)), []
  end

  test "#each that iterates trough the elements list", %{ list: list } do
    !assert MyEnum.each(list, &(&1)), []
    assert MyEnum.each([], &(&1)), []
  end
end
