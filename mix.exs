defmodule ColorStream.Mixfile do
  use Mix.Project

  def project do
    [app: :color_stream,
     version: "0.0.3",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:dogma, "~> 0.0", only: :dev},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
    ]
  end

  defp description do
    """
    Generate random colors that are fairly spaced out and look nice.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Nick Veys", "Gabe Cook"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/code-lever/color-stream-elixir",
      }
    ]
  end
end
