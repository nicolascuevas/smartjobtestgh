require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :name => "MyString",
      :value => 1,
      :correct_answer => "MyString",
      :type => "",
      :inputType => "MyString",
      :quiz => nil,
      :quiz_page => nil
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[name]"

      assert_select "input[name=?]", "question[value]"

      assert_select "input[name=?]", "question[correct_answer]"

      assert_select "input[name=?]", "question[type]"

      assert_select "input[name=?]", "question[inputType]"

      assert_select "input[name=?]", "question[quiz_id]"

      assert_select "input[name=?]", "question[quiz_page_id]"
    end
  end
end
