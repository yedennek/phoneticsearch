class Rules

  def ignore_non_alphabetic_characters input
    input.gsub(/[^a-zA-Z]/, "")
  end

  def discard_vowels input
    output = input[1..-1].gsub(/[aeiouwhy]/, "")
    input[0,1] + output
  end

  def replace_equivalent_letters input
    output = input.gsub(/[aeiou]/, "a")
    output = output.gsub(/[cgjkqsxyz]/, "c")
    output = output.gsub(/[bfpvw]/, "b")
    output = output.gsub(/[dt]/, "d")
    output = output.gsub(/[mn]/, "m")
  end

  def discard_consecutive_duplicates input
    input.squeeze
  end
end
