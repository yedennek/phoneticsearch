require_relative "../lib/phonetic_matcher"

class PhoneticSearcher

  def initialize surname_list
    @matcher = PhoneticMatcher.new
    @surname_hash = generate_surname_hash surname_list
  end

  def generate_surname_hash surname_list
    surname_hash = Hash.new {|hash, key| hash[key] = []}
    surname_list.each do |name|
      key = @matcher.generate_name_key name
      surname_hash[key] << name
    end
    surname_hash
  end

  def find_matches name
    key = @matcher.generate_name_key name
    @surname_hash[key]
  end
end
