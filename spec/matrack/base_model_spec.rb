require "spec_helper"
describe "base_model" do

  let(:model){ Matrack::BaseModel }

  describe "#property" do
    it "exits unsupported column types are used " do
      allow(model).to receive(:puts).and_return("DB ERROR")
      allow(model).to receive(:exit).and_return("Exiting")
      expect(model.property("age", "float")).to eq "Exiting"
    end
  end
end