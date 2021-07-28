defmodule WhileOk.MixProject do
  use Mix.Project

  def project do
    [
      app: :while_ok,
      version: "0.1.2",
      elixir: "~> 1.12-rc",
      description: description(),
      package: package(),
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Adds utilities for enumerating over collections until there is an error"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "while_ok",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*
                 CHANGELOG*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/MishaConway/while_ok"}
    ]
  end
end
