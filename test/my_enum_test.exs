defmodule MyEnumTest do
  use ExUnit.Case
  doctest MyEnum

  import ExUnit.CaptureIO

  setup_all do
    { :ok, [ list: [4, 5, 6, 7, 8] ] }
  end

  test "#all? returns true if the given `func` evaluates to true on any of the list items", %{ list: list } do
    assert MyEnum.all?(list, &(&1 > 3))
    assert MyEnum.all?([], &(&1 > 3)) # the same behaviour of `Enum.all/2`
  end

  test "#filter returns only those elements for which `func` returns a truthy value.", %{ list: list } do
    assert MyEnum.filter(list, &(&1 > 5)) == [6, 7, 8]
    assert MyEnum.filter([], &(&1 > 5)) == []
  end

  test "#each invokes the given `func` for each item in the enumerable.", %{ list: list } do
    func = fn ->
      assert MyEnum.each(list, &IO.puts/1) == :ok
    end

    assert capture_io(func) == "4\n5\n6\n7\n8\n"
  end

  describe "MyEnum.split/2" do
    test "splits in two a list leaving `count` elements in the first one", %{ list: list } do
      assert MyEnum.split(list, 3) == { [4, 5, 6], [7, 8] }
      assert MyEnum.split([], 3) == { [], [] }
      assert MyEnum.split(list, -2) == { [4, 5, 6], [7, 8] }
      # TODO: assert MyEnum.split(list, -6) == { [], [4, 5, 6, 7, 8] }
    end
  end
end
