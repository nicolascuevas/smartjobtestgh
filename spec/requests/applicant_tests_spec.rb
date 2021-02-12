require 'rails_helper'

RSpec.describe "ApplicantTests", type: :request do
  describe "GET /applicant_tests" do
    it "works! (now write some real specs)" do
      get applicant_tests_path
      expect(response).to have_http_status(200)
    end
  end
end
