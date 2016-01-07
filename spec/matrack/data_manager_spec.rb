require "spec_helper"

describe "data_manager" do
  let(:klass) { Matrack::DataManager }
  let(:table) { "users" }
  let(:query) { { name: "varchar", age: "integer" } }

  describe "#create_table_fields" do
    it "exits when in passed with an invalid table name " do
      allow(klass).to receive(:puts).and_return("DB ERROR")
      allow(klass).to receive(:exit).and_return("Exiting")
      expect(klass.create_table_fields("", query)).to eq "Exiting"
    end
  end

  describe "#create_table_fields" do
    it "exits when in passed with an invalid query " do
      allow(klass).to receive(:puts).and_return("DB ERROR")
      allow(klass).to receive(:exit).and_return("Exiting")
      expect(klass.create_table_fields(table, "")).to eq "Exiting"
    end
  end

end