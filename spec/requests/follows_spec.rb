require 'rails_helper'

RSpec.describe "Follows", type: :request do
  describe "GET /all_followers" do
    it "returns http success" do
      get "/follows/all_followers"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /all_followed" do
    it "returns http success" do
      get "/follows/all_followed"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create_followed" do
    it "returns http success" do
      get "/follows/create_followed"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy_followed" do
    it "returns http success" do
      get "/follows/destroy_followed"
      expect(response).to have_http_status(:success)
    end
  end

end
