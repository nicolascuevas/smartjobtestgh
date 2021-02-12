require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :name => "Name",
      :value => 2,
      :correct_answer => "Correct Answer",
      :type => "Type",
      :inputType => "Input Type",
      :quiz => nil,
      :quiz_page => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Correct Answer/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Input Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
