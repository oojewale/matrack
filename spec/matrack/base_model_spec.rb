require "spec_helper"
describe Matrack::BaseModel do

  before(:all) do
    @model = Matrack::BaseModel
  end

  describe "#property" do
    it "exits unsupported column types are used " do
      allow(@model).to receive(:puts).and_return("DB ERROR")
      expect(@model.property("age", "float")).to raise_error SystemExit
    end
  end
end