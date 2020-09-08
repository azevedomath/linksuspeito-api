require 'rails_helper'

RSpec.describe "Servers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/server/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /move" do
    it "returns http success" do
      get "/server/move"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /api" do
    it "returns http success" do
      get "/server/api"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /get_key" do
    it "returns http success" do
      get "/server/get_key"
      expect(response).to have_http_status(:success)
    end
  end

end
