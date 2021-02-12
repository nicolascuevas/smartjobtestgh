require "rails_helper"

RSpec.describe QuizPagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/quiz_pages").to route_to("quiz_pages#index")
    end

    it "routes to #new" do
      expect(:get => "/quiz_pages/new").to route_to("quiz_pages#new")
    end

    it "routes to #show" do
      expect(:get => "/quiz_pages/1").to route_to("quiz_pages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quiz_pages/1/edit").to route_to("quiz_pages#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/quiz_pages").to route_to("quiz_pages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/quiz_pages/1").to route_to("quiz_pages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/quiz_pages/1").to route_to("quiz_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quiz_pages/1").to route_to("quiz_pages#destroy", :id => "1")
    end
  end
end
