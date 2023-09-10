defmodule Etorrent.MixProject do
  use Mix.Project

  def project do
    [
      app: :etorrent,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:bencoding, git: "https://github.com/wilkmaia/bencoding.git", tag: "v0.1.1"}
      {:bencoding, path: "F:\\Projetos\\bencoding"}
    ]
  end
end
