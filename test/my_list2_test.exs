defmodule MyList2Test do
  use ExUnit.Case
  doctest MyList2

  setup_all do
    { :ok, [ list: [4, 5, 6, 7, 8] ] }
  end

  test "#all? elements are greater than 3", %{ list: list } do
    assert MyList2.all?(list, &(&1 > 3))
    assert MyList2.all?([], &(&1 > 3)) # the same behaviour of `Enum.all/2`
  end

  test "#filter numbers greater than 5", %{ list: list } do
    assert MyList2.filter(list, &(&1 > 5)), [6, 7, 8]
    assert MyList2.filter([], &(&1 > 5)), []
  end
end
