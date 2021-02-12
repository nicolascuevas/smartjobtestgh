require 'rails_helper'

RSpec.describe "quizzes/edit", type: :view do
  before(:each) do
    @quiz = assign(:quiz, Quiz.create!(
      :name => "MyString",
      :description => "MyString",
      :quiz_data => ""
    ))
  end

  it "renders the edit quiz form" do
    render

    assert_select "form[action=?][method=?]", quiz_path(@quiz), "post" do

      assert_select "input[name=?]", "quiz[name]"

      assert_select "input[name=?]", "quiz[description]"

      assert_select "input[name=?]", "quiz[quiz_data]"
    end
  end
end
