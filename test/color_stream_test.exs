defmodule ColorStreamTest do
  use ExUnit.Case
  doctest ColorStream

  [
    [{0, 0, 0}, "000000"],
    [{1, 1, 1}, "010101"],
    [{100, 100, 100}, "646464"],
    [{1, 128, 250}, "0180FA"],
    [{255, 0, 255}, "FF00FF"],
    [{0, 128, 0}, "008000"],
  ]
  |> Enum.each(fn ([triplet, expected]) ->
    @triplet triplet
    @expected expected
    test "rgb_to_hex(#{inspect(@triplet)}) converts to #{@expected}" do
      assert ColorStream.rgb_to_hex(@triplet) == @expected
    end
  end)
end
