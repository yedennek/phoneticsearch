require_relative "../lib/phonetic_searcher"

describe PhoneticSearcher do
  describe "#generate_surname_hash" do
     it "returns a hash of phonetic keys to surnames for a given array of surnames" do
      surname_list = ["Winton", "Smith", "Schmidt"]
      expect(subject.generate_surname_hash surname_list).to eq("bmdm" => ["Winton"], "cmd" => ["Smith", "Schmidt"])
    end
  end

  describe "#find_matches" do
    it "returns a list of matching names" do
      dictionary = {"cnd" => ["Kennedy"], "cmd" => ["Smith", "Schmidt"]}
      expect(subject.find_matches "Smith", dictionary).to eq ["Smith", "Schmidt"]
    end
  end

  #describe "integration" do
    #it "should return original name and matches when given a set of names and a dictionary" do
    #end
  #end
end
