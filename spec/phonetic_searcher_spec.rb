require_relative "../lib/phonetic_searcher"

describe PhoneticSearcher do
  let(:surname_list) { ["Winton", "Smith", "Schmidt"] }
  subject { described_class.new surname_list }

  describe "#generate_surname_hash" do
    it "returns a hash of phonetic keys to surnames for a given array of surnames" do
      expect(subject.generate_surname_hash surname_list).to eq("bmdm" => ["Winton"], "cmd" => ["Smith", "Schmidt"])
    end
  end

  describe "#find_matches" do
    it "returns a list of matching names" do
      expect(subject.find_matches "Smith").to eq ["Smith", "Schmidt"]
    end
  end
end
