require 'rails_helper'

RSpec.describe "applicants/edit", type: :view do
  before(:each) do
    @applicant = assign(:applicant, Applicant.create!(
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :token => "MyString"
    ))
  end

  it "renders the edit applicant form" do
    render

    assert_select "form[action=?][method=?]", applicant_path(@applicant), "post" do

      assert_select "input[name=?]", "applicant[email]"

      assert_select "input[name=?]", "applicant[first_name]"

      assert_select "input[name=?]", "applicant[last_name]"

      assert_select "input[name=?]", "applicant[token]"
    end
  end
end
