# RomanNumeral

**example library for roman numeral conversions in Elixir**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `roman_numeral` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:roman_numeral, "~> 0.1.0"}]
end
```

## Usage

The library should be imported within a module:

    import RomanNumeral, only: to_roman, to_arabic

    to_roman(9) => "IX"
    to_arabic("VIII") => 8

## Testing

To ensure that the RomanNumeral library is functioning correctly, run the tests:

    mix test

## Author:

    Alan Stebbens, <aks@stebbens.org>

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/roman_numeral](https://hexdocs.pm/roman_numeral).

