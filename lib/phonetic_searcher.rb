require "phonetic_matcher"

class PhoneticSearcher

  def initialize
    @matcher = PhoneticMatcher.new
  end

  def generate_surname_hash surname_list
    surname_hash = Hash.new {|hash, key| hash[key] = []}
    surname_list.each do |name|
      key = @matcher.generate_name_key name
      surname_hash[key] << name
    end
    surname_hash
  end

  def find_matches name, dictionary
    key = @matcher.generate_name_key name
    dictionary[key]
  end
end
