defmodule Chat.Mixfile do
  use Mix.Project

  def project do
    [
      app: :chat,
      version: "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: ["lib", "web"],
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  def application do
    [mod: {Chat, []}, extra_applications: [:logger]]
  end

  defp deps do
    [
      {:phoenix, "~> 1.3"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.1", only: :dev},
      {:postgrex, "~> 0.13"},
      {:cowboy, "~> 1.1"},
      {:libcluster, "~> 3.0"}
    ]
  end
end
