require "spec_helper"
describe "data_utility" do
  let(:query_hash) { { name: :str, age: :int, birthday: :date} }
  let(:query_str) { " name str, age int, birthday date"}

  describe "#create_table_query" do
    it "returns creat query hash as string" do
      expect(DataUtility.create_table_query(query_hash)).to eq query_str
    end
  end

end