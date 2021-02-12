require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :name => "MyString",
      :value => 1,
      :correct_answer => "MyString",
      :type => "",
      :inputType => "MyString",
      :quiz => nil,
      :quiz_page => nil
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

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
