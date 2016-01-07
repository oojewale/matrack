require "spec_helper"
describe "data_manager" do

  before(:all) do
    @mgr = Matrack::DataManger
    let(:table) { "users" }
    let(:query) { { name: "varchar", age: "integer" } }
  end

  describe "#create_table_fields" do
    it "exits when in passed with an invalid table name " do
      allow(@mgr).to receive(:puts).and_return("DB ERROR")
      expect(@mgr.create_table_fields("", query)).to raise_error SystemExit
    end
  end

  describe "#create_table_fields" do
    it "exits when in passed with an invalid query " do
      allow(@mgr).to receive(:puts).and_return("DB ERROR")
      expect(@mgr.create_table_fields(table, "")).to raise_error SystemExit
    end
  end

end