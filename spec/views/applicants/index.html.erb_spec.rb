require 'rails_helper'

RSpec.describe "applicants/index", type: :view do
  before(:each) do
    assign(:applicants, [
      Applicant.create!(
        :email => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :token => "Token"
      ),
      Applicant.create!(
        :email => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :token => "Token"
      )
    ])
  end

  it "renders a list of applicants" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
