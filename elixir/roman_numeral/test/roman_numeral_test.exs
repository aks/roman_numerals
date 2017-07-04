defmodule RomanNumeralTest do
  use ExUnit.Case
  import RomanNumeral

  describe "to_roman" do

    test    "1",  do: assert to_roman("1")    == "I"
    test    "2",  do: assert to_roman("2")    == "II"
    test    "3",  do: assert to_roman("3")    == "III"
    test    "4",  do: assert to_roman("4")    == "IV"
    test    "5",  do: assert to_roman("5")    == "V"
    test    "6",  do: assert to_roman("6")    == "VI"
    test    "8",  do: assert to_roman("8")    == "VIII"
    test   "15",  do: assert to_roman("15")   == "XV"
    test   "21",  do: assert to_roman("21")   == "XXI"
    test   "35",  do: assert to_roman("35")   == "XXXV"
    test   "44",  do: assert to_roman("44")   == "XLIV"
    test   "98",  do: assert to_roman("98")   == "XCVIII"
    test  "490",  do: assert to_roman("490")  == "CDXC"
    test  "501",  do: assert to_roman("501")  == "DI"
    test  "904",  do: assert to_roman("904")  == "CMIV"
    test  "909",  do: assert to_roman("909")  == "CMIX"
    test "3200",  do: assert to_roman("3200") == "MMMCC"

    test    "int 1",  do: assert to_roman(1)    == "I"
    test    "int 2",  do: assert to_roman(2)    == "II"
    test    "int 3",  do: assert to_roman(3)    == "III"
    test    "int 4",  do: assert to_roman(4)    == "IV"
    test    "int 5",  do: assert to_roman(5)    == "V"
    test    "int 6",  do: assert to_roman(6)    == "VI"
    test    "int 8",  do: assert to_roman(8)    == "VIII"
    test   "int 15",  do: assert to_roman(15)   == "XV"
    test   "int 21",  do: assert to_roman(21)   == "XXI"
    test   "int 35",  do: assert to_roman(35)   == "XXXV"
    test   "int 44",  do: assert to_roman(44)   == "XLIV"
    test   "int 98",  do: assert to_roman(98)   == "XCVIII"
    test  "int 490",  do: assert to_roman(490)  == "CDXC"
    test  "int 501",  do: assert to_roman(501)  == "DI"
    test  "int 904",  do: assert to_roman(904)  == "CMIV"
    test  "int 909",  do: assert to_roman(909)  == "CMIX"
    test "int 3200",  do: assert to_roman(3200) == "MMMCC"

  end

  describe "to_arabic" do

    test "I",       do: assert to_arabic("I")      == 1
    test "II",      do: assert to_arabic("II")     == 2
    test "III",     do: assert to_arabic("III")    == 3
    test "IV",      do: assert to_arabic("IV")     == 4
    test "V",       do: assert to_arabic("V")      == 5
    test "VI",      do: assert to_arabic("VI")     == 6
    test "VIII",    do: assert to_arabic("VIII")   == 8
    test "XV",      do: assert to_arabic("XV")     == 15
    test "XXI",     do: assert to_arabic("XXI")    == 21
    test "XXXV",    do: assert to_arabic("XXXV")   == 35
    test "XLIV",    do: assert to_arabic("XLIV")   == 44
    test "XCVIII",  do: assert to_arabic("XCVIII") == 98
    test "CDXC",    do: assert to_arabic("CDXC")   == 490
    test "DI",      do: assert to_arabic("DI")     == 501
    test "CMIV",    do: assert to_arabic("CMIV")   == 904
    test "CMIX",    do: assert to_arabic("CMIX")   == 909
    test "MMMCC",   do: assert to_arabic("MMMCC")  == 3200

  end
end

