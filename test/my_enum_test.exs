defmodule MyEnumTest do
  use ExUnit.Case
  doctest MyEnum

  import ExUnit.CaptureIO

  setup_all do
    { :ok, [ list: [4, 5, 6, 7, 8] ] }
  end

  describe "MyEnum.all?/2" do
    test "returns true if the given `func` evaluates to true on any of the list items", %{ list: list } do
      assert MyEnum.all?(list, &(&1 > 3))
    end

    test "returns true when is given an empty list" do
      assert MyEnum.all?([], &(&1 > 3)) # the same behaviour of `Enum.all/2`
    end
  end


  describe "MyEnum.filter/2" do
    test "returns only those elements for which `func` returns a truthy value.", %{ list: list } do
      assert MyEnum.filter(list, &(&1 > 5)) == [6, 7, 8]
    end

    test "returns an empty list in case is given an empty list" do
      assert MyEnum.filter([], &(&1 > 5)) == []
    end
  end

  describe "MyEnum.each/2" do
    test "invokes the given `func` for each item in the enumerable.", %{ list: list } do
      func = fn ->
        assert MyEnum.each(list, &IO.puts/1) == :ok
      end

      assert capture_io(func) == "4\n5\n6\n7\n8\n"
    end
  end

  describe "MyEnum.split/2" do
    test "splits in two a list leaving `count` elements in the first one", %{ list: list } do
      assert MyEnum.split(list, 3) == { [4, 5, 6], [7, 8] }
      assert MyEnum.split(list, -2) == { [4, 5, 6], [7, 8] }
    end

    test "returns a tuple with two empty lists when is given an empty list" do
      assert MyEnum.split([], 3) == { [], [] }
    end

    test "returns a tuple with an empty list as the first one when a negative count is greather than list length" do
      # TODO: assert MyEnum.split(list, -6) == { [], [4, 5, 6, 7, 8] }
    end
  end

  describe "MyEnum.reverse/1" do
    test "reverts the order of a list", %{ list: list } do
      assert MyEnum.reverse(list) == [8, 7, 6, 5, 4]
    end

    test "returns an empty list when given an empty one" do
      assert MyEnum.reverse([]) == []
    end
  end
end
