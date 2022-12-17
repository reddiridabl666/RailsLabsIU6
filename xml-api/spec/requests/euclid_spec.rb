require 'rails_helper'

RSpec.describe "Euclids", type: :request do
  describe "GET /result" do
    it "returns correct results on valid input" do
      get root_path, params: { input1: 36, input2: 48 }

      expect(response).to have_http_status(:success)

      expect(assigns(:gcd)).to eq 12
      expect(assigns(:lcm)).to eq 144

      expect(response.content_type).to eq 'application/xml; charset=utf-8'
      end

    it "returns error on invalid input" do
      get root_path, params: { input1: -36, input2: 48 }

      expect(response).to have_http_status(:success)
      expect(response.body).to include('You should enter a natural number in both inputs')
      expect(response.content_type).to eq 'application/xml; charset=utf-8'
    end
  end
end
