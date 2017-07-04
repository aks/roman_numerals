defmodule RomanNumeral do
  @moduledoc """
  Documentation for RomanNumeral.
  """

  @doc """
  Convert arabic numbers to roman numeral, and vice-versa.

  ## Examples

      iex> RomanNumeral.to_roman(1234)
      MCCXXXIV

      iex> RomanNumeral.to_roman("1234")
      MCCXXXIV

  """

  @roman_map [
    { "M", 1000, "C", 100 },
    { "D",  500, "C", 100 },
    { "C",  100, "X",  10 },
    { "L",   50, "X",  10 },
    { "X",   10, "I",   1 },
    { "V",    5, "I",   1 },
    { "I",    1, "I",   1 },
  ]

  def to_roman(0),   do: ""
  def to_roman("0"), do: ""
  def to_roman(arg) when is_integer(arg) do
    int_to_roman_with_map(arg, @roman_map)
  end

  def to_roman(arg) do
    String.to_integer(arg) |> int_to_roman_with_map(@roman_map)
  end

  def int_to_roman_with_map(num, roman_map) when num == 0, do: ""
  def int_to_roman_with_map(num, roman_map) when length(num) == 0, do: ""
  def int_to_roman_with_map(num, roman_map) do
    [current_set | remaining_map] = roman_map
    {letter, letter_value, roman_prefix, prefix_offset} = current_set
    prefix_value = letter_value - prefix_offset
    cond do
      num < letter_value && num >= prefix_value ->
        roman_prefix <> letter <> int_to_roman_with_map(num - prefix_value, remaining_map)
      num < letter_value ->
        int_to_roman_with_map(num, remaining_map)
      true ->
        {quotient, remainder} = {div(num, letter_value), rem(num, letter_value)}
        String.duplicate(letter, quotient) <> int_to_roman_with_map(remainder, remaining_map)
    end
  end

  @roman_letters %{  "M" => 1000,
                    "CM" =>  900,
                     "D" =>  500,
                    "CD" =>  400,
                     "C" =>  100,
                    "XC" =>   90,
                     "L" =>   50,
                    "XL" =>   40,
                     "X" =>   10,
                    "IX" =>    9,
                     "V" =>    5,
                    "IV" =>    4,
                     "I" =>    1}

  @roman_letters_re ~r{(C[MD]|X[CL]|I[XV]|[MDCLXVI])}

  def to_arabic(roman) do
    roman_num = String.upcase(roman)
    roman_numbers = Regex.scan(@roman_letters_re, roman_num)
    List.foldl(roman_numbers, 0, fn(x, acc) -> acc + @roman_letters[hd(x)] end)
  end

end
