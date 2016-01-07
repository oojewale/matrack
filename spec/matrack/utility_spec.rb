require "spec_helper"
describe "utility" do
  let(:str) { "InternetOfThings" }
  let(:bool_val) { "true" }
# before :all  do
#   first_string = "InternetOfThings"
#   sec_string = "InternetOfThings"
#   first_string = "InternetOfThings"
# end

  describe "string#to_snake_case" do
    it "turns a new string object to snake case " do
      expect(str.to_snake_case).to eq "internet_of_things"
    end
  end
end