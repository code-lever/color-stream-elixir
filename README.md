# ColorStream

Generate random colors in a pleasing way, based on work from the [ColorGenerator](https://github.com/jpmckinney/color-generator) Ruby gem, and the [How to Generate Random Colors Programmatically](http://martin.ankerl.com/2009/12/09/how-to-create-random-colors-programmatically/) post by Martin Ankerl.

## Installation

Add color_stream to your list of dependencies in `mix.exs`:

    def deps do
      [{:color_stream, "~> 0.0.1"}]
    end

## Basic Usage

    iex> ColorStream.hex |> Enum.take(5)
    ["7F6C3F", "5A3F7F", "3F7F47", "7F3F4A", "3F5D7F"]

    iex> ColorStream.hex(hue: 0.5) |> Enum.take(2)
    ["F1BE42", "8B42F1"]

Be sure to read [the documentation too](http://hexdocs.pm/color_stream).
