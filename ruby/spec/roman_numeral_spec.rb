require 'roman_numeral.rb'

describe 'Numeral' do

  [
    [ 1, 'I' ],
    [ 2, 'II' ],
    [ 3, 'III' ],
    [ 4, 'IV' ],
    [ 5, 'V' ],
    [ 6, 'VI' ],
    [ 8, 'VIII' ],
    [ 15, 'XV' ],
    [ 21, 'XXI' ],
    [ 35, 'XXXV' ],
    [ 44, 'XLIV' ],
    [ 98, 'XCVIII' ],
    [ 490, 'CDXC'],
    [ 501, 'DI'],
    [ 904, 'CMIV' ],
    [ 909, 'CMIX' ],
    [ 3200, 'MMMCC' ]
  ].each do |arabic_numeral, roman_numeral|

    describe "#to_roman" do
      it "should convert #{arabic_numeral} to #{roman_numeral}" do
        test_roman_numeral = RomanNumeral.to_roman(arabic_numeral)
        expect(test_roman_numeral).to eq(roman_numeral)
      end
    end

    describe "#to_arabic" do
      it "should convert #{roman_numeral} to #{arabic_numeral}" do
        test_arabic_numeral = RomanNumeral.to_arabic(roman_numeral)
        expect(test_arabic_numeral).to eq(arabic_numeral)
      end
    end
  end
end
