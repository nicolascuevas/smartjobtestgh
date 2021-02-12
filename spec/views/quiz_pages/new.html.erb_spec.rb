require 'rails_helper'

RSpec.describe "quiz_pages/new", type: :view do
  before(:each) do
    assign(:quiz_page, QuizPage.new(
      :title => "MyString",
      :quiz => nil
    ))
  end

  it "renders new quiz_page form" do
    render

    assert_select "form[action=?][method=?]", quiz_pages_path, "post" do

      assert_select "input[name=?]", "quiz_page[title]"

      assert_select "input[name=?]", "quiz_page[quiz_id]"
    end
  end
end
