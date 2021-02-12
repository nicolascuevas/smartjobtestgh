require 'rails_helper'

RSpec.describe "applicant_tests/show", type: :view do
  before(:each) do
    @applicant_test = assign(:applicant_test, ApplicantTest.create!(
      :applicant => nil,
      :applicant_test_status => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
