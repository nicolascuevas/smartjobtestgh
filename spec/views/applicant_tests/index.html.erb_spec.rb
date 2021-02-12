require 'rails_helper'

RSpec.describe "applicant_tests/index", type: :view do
  before(:each) do
    assign(:applicant_tests, [
      ApplicantTest.create!(
        :applicant => nil,
        :applicant_test_status => nil
      ),
      ApplicantTest.create!(
        :applicant => nil,
        :applicant_test_status => nil
      )
    ])
  end

  it "renders a list of applicant_tests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
