require 'phonetic_matcher'

describe PhoneticMatcher do

  describe "#generate_name_key" do
    it "applies phonetic algorithm to input names to generate a hash key" do
      expect(subject.generate_name_key "Nest O'Mallet").to eq "mcdmld"
    end
  end

  describe "#ignore_non_alphabetic_characters" do
    it "returns the input with non-alphabetic characters removed" do
      expect(subject.ignore_non_alphabetic_characters "Nest O'Mallet").to eq "NestOMallet"
    end
  end

  describe "#discard_vowels" do
    it "removes vowel-like characters from the input" do
      expect(subject.discard_vowels "nestmallet").to eq "nstmllt"
      expect(subject.discard_vowels "anna").to eq "ann"
      expect(subject.discard_vowels "eilonwhy").to eq "eln"
    end
  end

  describe "#replace_equivalent_letters" do
    it "replaces equivalent characters with first equivalent" do
      expect(subject.replace_equivalent_letters "aeiou").to eq "aaaaa"
      expect(subject.replace_equivalent_letters "cgjkqsxyz").to eq "ccccccccc"
      expect(subject.replace_equivalent_letters "bfpvw").to eq "bbbbb"
      expect(subject.replace_equivalent_letters "dt").to eq "dd"
      expect(subject.replace_equivalent_letters "mn").to eq "mm"
    end
  end

  describe "#discard_consecutive_duplicates" do
    it "discards any consecutive duplicate letters" do
      expect(subject.discard_consecutive_duplicates "annknnd").to eq "anknd"
      expect(subject.discard_consecutive_duplicates "rblddl").to eq "rbldl"
      expect(subject.discard_consecutive_duplicates "crrbccl").to eq "crbcl"
    end
  end
end
