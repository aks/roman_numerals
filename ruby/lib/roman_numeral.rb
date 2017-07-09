class RomanNumeral

  Roman_Map = [
              [ :M, 1000, :C, 100 ],
              [ :D, 500 , :C, 100 ],
              [ :C, 100 , :X, 10  ],
              [ :L, 50  , :X, 10  ],
              [ :X, 10  , :I, 1   ],
              [ :V, 5   , :I, 1   ],
              [ :I, 1   , :I, 1 ]
            ]

  # 98    => XCVIII
  # 490   => CDXC
  # 904   => CMIV
  #
  # I before V or X
  # X before L or C
  # C before D or M

  def self.to_roman(arabic_number)
    new(arabic_number).to_roman
  end

  def self.to_arabic(roman_number)
    new(roman_number).to_arabic
  end

  def initialize(a_number)
    @number = a_number
  end

  @@cache = {}

  def self.clear_cache!
    @@cache.clear
  end

  def to_roman
    @@cache[@number.to_i] ||= convert_to_roman
  end

  def to_arabic
    @@cache[@number] ||= convert_to_arabic
  end

  private

  def convert_to_roman
    arabic_num = @number.to_i
    result = ''
    while arabic_num > 0 do
      Roman_Map.each do |roman_letter, letter_value, roman_prefix, prefix_offset|
        letter = roman_letter.to_s
        if arabic_num < letter_value && arabic_num >= (letter_value - prefix_offset)
          new_roman_letters = roman_prefix.to_s + letter
          arabic_num -= (letter_value - prefix_offset)
        elsif arabic_num < letter_value
          next
        else
          div, rem = arabic_num / letter_value, arabic_num % letter_value
          new_roman_letters = letter * div
          arabic_num = rem
        end
        result += new_roman_letters
        break if arabic_num == 0
      end
    end
    result
  end

  Roman_Letters =
    { 'M'  => 1000,
      'CM' =>  900,
      'D'  =>  500,
      'CD' =>  400,
      'C'  =>  100,
      'XC' =>   90,
      'L'  =>   50,
      'XL' =>   40,
      'X'  =>   10,
      'IX' =>    9,
      'V'  =>    5,
      'IV' =>    4,
      'I'  =>    1
   }

  Roman_Letters_RE = /C[MD]|X[CL]|I[XV]|[MDCLXVI]/

  def convert_to_arabic
    @number.to_s.upcase.scan(Roman_Letters_RE).map do |roman_letter|
      Roman_Letters[roman_letter]
    end.compact.reduce(:+)
  end

end
