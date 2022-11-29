require 'rails_helper'

RSpec.describe "Euclids", type: :request do
  describe "POST /result" do
  #   it "assigns gcd and lam" do
  #     post result_path, params: { input1: '36', input2: '48' }
  #
  #     expected_gcd = 12
  #     expected_lcm = 144
  #
  #     expect(assigns(:gcd)).to eq(expected_gcd)
  #     expect(assigns(:lcm)).to eq(expected_lcm)
  #   end

    it "redirects on invalid query" do
      post result_path, params: { input1: 'gdgd', input2: '48' }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it "redirects on negative numbers" do
      post result_path, params: { input1: '-5', input2: '48' }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get root_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end
  end
end
