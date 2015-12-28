defmodule ColorStream.Mixfile do
  use Mix.Project

  def project do
    [app: :color_stream,
     version: "0.0.2",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:dogma, "~> 0.0", only: :dev},
      {:earmark, only: :dev},
      {:ex_doc, "~> 0.10", only: :dev},
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
