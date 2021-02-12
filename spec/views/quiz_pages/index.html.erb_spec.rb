require 'rails_helper'

RSpec.describe "quiz_pages/index", type: :view do
  before(:each) do
    assign(:quiz_pages, [
      QuizPage.create!(
        :title => "Title",
        :quiz => nil
      ),
      QuizPage.create!(
        :title => "Title",
        :quiz => nil
      )
    ])
  end

  it "renders a list of quiz_pages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
