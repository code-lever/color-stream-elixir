defmodule ColorStream do
  @moduledoc """
  Functions for generating colors in a fairly nice-looking way.
  """

  @golden_ratio_conjugate 0.618033988749895

  @doc """
  Starts an infinite stream of colors generated as 6-character hex strings.

  ## Options

    * `:hue` - initial hue (0..1]
    * `:saturation` - saturation (0..1)
    * `:value` - value (0..1)
  """
  def hex(opts \\ []) do
    Stream.resource(
      fn ->
        {
          Keyword.get(opts, :hue, :random.uniform),
          Keyword.get(opts, :saturation, :random.uniform),
          Keyword.get(opts, :value, :random.uniform)
        }
      end,
      fn {h, s, v} ->
        h_updated = h + @golden_ratio_conjugate
        hue = h_updated - trunc(h_updated)
        {[hsv_to_hex(hue, s, v)], {hue, s, v}}
      end,
      fn _ ->
        nil
      end
    )
  end

  def hsv_to_hex(h, s, v) when h >= 0 and h < 1 and s >= 0 and s <= 1 and v >= 0 and v <= 1 do
    hsv_to_rgb(h, s, v)
    |> rgb_to_hex
  end

  def hsv_to_rgb(h, s, v) when h >= 0 and h < 1 and s >= 0 and s <= 1 and v >= 0 and v <= 1 do
    h_i = trunc(h * 6)
    f = (h * 6) - h_i
    p = v * (1 - s)
    q = v * (1 - (f * s))
    t = v * (1 - (1 - f) * s)

    {r, g, b} = case h_i do
      0 -> {v, t, p}
      1 -> {q, v, p}
      2 -> {p, v, t}
      3 -> {p, q, v}
      4 -> {t, p, v}
      5 -> {v, p, q}
    end

    {trunc(r * 255), trunc(g * 255), trunc(b * 255)}
  end

  def hsv360_to_rgb(h, s, v) when h >= 0 and h < 360 and s >= 0 and s <= 1 and v >= 0 and v <= 1 do
    hsv_to_rgb(h / 360, s, v)
  end

  @spec hsv360_to_rgb({Float.t, Float.t, Float.t}) :: String.t
  def hsv360_to_rgb({r, g, b} = _triplet), do: hsv360_to_rgb(r, g, b)

  @doc """
  Converts an RGB color to its 6-character hex representation.

  ## Examples:
      iex> ColorStream.rgb_to_hex(0, 0, 0)
      "000000"

      iex> ColorStream.rgb_to_hex(25, 100, 190)
      "1964BE"
  """
  @spec rgb_to_hex(Float.t, Float.t, Float.t) :: String.t
  def rgb_to_hex(r, g, b) when r in 0..255 when g in 0..255 when b in 0..255 do
    "~2.16.0B"
    |> List.duplicate(3)
    |> Enum.join
    |> :io_lib.format([r, g, b])
    |> to_string
  end

  @doc """
  Converts an RGB color to its 6-character hex representation.

  ## Examples:
      iex> ColorStream.rgb_to_hex({5, 19, 0})
      "051300"

      iex> ColorStream.rgb_to_hex({125, 100, 190})
      "7D64BE"
  """
  @spec rgb_to_hex({Float.t, Float.t, Float.t}) :: String.t
  def rgb_to_hex({r, g, b} = _triplet), do: rgb_to_hex(r, g, b)
end
