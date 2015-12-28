defmodule ColorStream do

  def rgb_to_hex(r, g, b) when r in 0..255 when g in 0..255 when b in 0..255 do
    "~2.16.0B"
    |> List.duplicate(3)
    |> Enum.join
    |> :io_lib.format([r, g, b])
    |> to_string
  end
  def rgb_to_hex({r, g, b}), do: rgb_to_hex(r, g, b)
end
