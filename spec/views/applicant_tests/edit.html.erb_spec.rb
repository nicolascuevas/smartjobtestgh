require 'rails_helper'

RSpec.describe "applicant_tests/edit", type: :view do
  before(:each) do
    @applicant_test = assign(:applicant_test, ApplicantTest.create!(
      :applicant => nil,
      :applicant_test_status => nil
    ))
  end

  it "renders the edit applicant_test form" do
    render

    assert_select "form[action=?][method=?]", applicant_test_path(@applicant_test), "post" do

      assert_select "input[name=?]", "applicant_test[applicant_id]"

      assert_select "input[name=?]", "applicant_test[applicant_test_status_id]"
    end
  end
end
