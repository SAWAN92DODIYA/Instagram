require 'rails_helper'

RSpec.describe "SavedPosts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/saved_posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/saved_posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/saved_posts/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/saved_posts/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
