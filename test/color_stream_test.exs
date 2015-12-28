defmodule ColorStreamTest do
  use ExUnit.Case, async: true
  doctest ColorStream

  [
    [{358, 0.8, 0.8}, {204, 40, 46}],
    [{0.0, 0.8, 0.8}, {204, 40, 40}],
    [{35, 0.2, 0.5}, {127, 116, 102}],
    [{0.0, 0.0, 0.0}, {0, 0, 0}],
  ]
  |> Enum.each(fn ([triplet, expected]) ->
    @triplet triplet
    @expected expected
    test "hsv360_to_rgb(#{inspect(@triplet)}) converts to #{inspect(@expected)}" do
      assert ColorStream.hsv360_to_rgb(@triplet) == @expected
    end
  end)

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

  test ":hex stream" do
    values =
      ColorStream.hex(hue: 0.5, saturation: 0.5, value: 0.5)
      |> Enum.take(5)

    assert 5 == Enum.count(values)
  end
end
