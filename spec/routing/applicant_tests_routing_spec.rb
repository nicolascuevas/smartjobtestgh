require "rails_helper"

RSpec.describe ApplicantTestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/applicant_tests").to route_to("applicant_tests#index")
    end

    it "routes to #new" do
      expect(:get => "/applicant_tests/new").to route_to("applicant_tests#new")
    end

    it "routes to #show" do
      expect(:get => "/applicant_tests/1").to route_to("applicant_tests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/applicant_tests/1/edit").to route_to("applicant_tests#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/applicant_tests").to route_to("applicant_tests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/applicant_tests/1").to route_to("applicant_tests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/applicant_tests/1").to route_to("applicant_tests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/applicant_tests/1").to route_to("applicant_tests#destroy", :id => "1")
    end
  end
end
