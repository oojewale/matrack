require "spec_helper"
describe "utility" do
  let(:str) { "InternetOfThings" }
  let(:bool_val) { "true" }

  describe "string#to_snake_case" do
    it "turns a new string object to snake case " do
      expect(str.to_snake_case).to eq "internet_of_things"
    end
  end

  describe "string#to_b" do
    it "turns a true string value to bool true " do
      expect(bool_val.to_b).to be true
    end
  end

  describe "string#to_b" do
    let(:bool_val) { "false" }
    it "turns a false string value to bool false " do
      expect(bool_val.to_b).to be false
    end
  end

  describe "string#to_b" do
    let(:bool_val) { "any_random_string" }
    it "turns it to bool false " do
      expect(bool_val.to_b).to be false
    end
  end

  describe "string#titleize" do
    let(:str) { "any random string" }
    it "turns it to title case " do
      expect(str.titleize).to eq "Any Random String"
    end
  end

  describe "string#pluralize" do
    let(:str) { "boy" }
    it "turns it to plural " do
      expect(str.pluralize).to eq "boys"
    end
  end

  describe "string#pluralize" do
    let(:str) { "fishes" }
    it "does not pluralize plurals " do
      expect(str.pluralize).to be nil
    end
  end

end