require 'rails_helper'

RSpec.describe "quizzes/new", type: :view do
  before(:each) do
    assign(:quiz, Quiz.new(
      :name => "MyString",
      :description => "MyString",
      :quiz_data => ""
    ))
  end

  it "renders new quiz form" do
    render

    assert_select "form[action=?][method=?]", quizzes_path, "post" do

      assert_select "input[name=?]", "quiz[name]"

      assert_select "input[name=?]", "quiz[description]"

      assert_select "input[name=?]", "quiz[quiz_data]"
    end
  end
end
