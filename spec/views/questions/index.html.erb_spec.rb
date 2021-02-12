require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :name => "Name",
        :value => 2,
        :correct_answer => "Correct Answer",
        :type => "Type",
        :inputType => "Input Type",
        :quiz => nil,
        :quiz_page => nil
      ),
      Question.create!(
        :name => "Name",
        :value => 2,
        :correct_answer => "Correct Answer",
        :type => "Type",
        :inputType => "Input Type",
        :quiz => nil,
        :quiz_page => nil
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Correct Answer".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Input Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
