require 'rails_helper'

RSpec.describe "applicants/new", type: :view do
  before(:each) do
    assign(:applicant, Applicant.new(
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :token => "MyString"
    ))
  end

  it "renders new applicant form" do
    render

    assert_select "form[action=?][method=?]", applicants_path, "post" do

      assert_select "input[name=?]", "applicant[email]"

      assert_select "input[name=?]", "applicant[first_name]"

      assert_select "input[name=?]", "applicant[last_name]"

      assert_select "input[name=?]", "applicant[token]"
    end
  end
end
