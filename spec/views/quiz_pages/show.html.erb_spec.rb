require 'rails_helper'

RSpec.describe "quiz_pages/show", type: :view do
  before(:each) do
    @quiz_page = assign(:quiz_page, QuizPage.create!(
      :title => "Title",
      :quiz => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
