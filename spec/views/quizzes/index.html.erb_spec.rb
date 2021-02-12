require 'rails_helper'

RSpec.describe "quizzes/index", type: :view do
  before(:each) do
    assign(:quizzes, [
      Quiz.create!(
        :name => "Name",
        :description => "Description",
        :quiz_data => ""
      ),
      Quiz.create!(
        :name => "Name",
        :description => "Description",
        :quiz_data => ""
      )
    ])
  end

  it "renders a list of quizzes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
