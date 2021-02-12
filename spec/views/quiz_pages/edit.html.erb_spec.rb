require 'rails_helper'

RSpec.describe "quiz_pages/edit", type: :view do
  before(:each) do
    @quiz_page = assign(:quiz_page, QuizPage.create!(
      :title => "MyString",
      :quiz => nil
    ))
  end

  it "renders the edit quiz_page form" do
    render

    assert_select "form[action=?][method=?]", quiz_page_path(@quiz_page), "post" do

      assert_select "input[name=?]", "quiz_page[title]"

      assert_select "input[name=?]", "quiz_page[quiz_id]"
    end
  end
end
