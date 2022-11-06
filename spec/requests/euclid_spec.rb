require 'rails_helper'

RSpec.describe "Euclids", type: :request do
  describe "GET /result" do
    it "returns http success" do
      get "/euclid/result"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/euclid/index"
      expect(response).to have_http_status(:success)
    end
  end

end
