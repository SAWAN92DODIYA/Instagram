require 'rails_helper'

RSpec.describe "Conversations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/conversation/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/conversation/create"
      expect(response).to have_http_status(:success)
    end
  end

end
