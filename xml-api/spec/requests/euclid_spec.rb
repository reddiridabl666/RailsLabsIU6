require 'rails_helper'

RSpec.describe "Euclids", type: :request do
  describe "GET /result" do
    it "returns http success on valid query" do
      get "/euclid/result/?input_1=5&input2=1"

      expect(response).to have_http_status(:success)
      expect(response).to render_template("result")
    end

    it "returns valid GCD and LCM" do
      expected_gcd = 12
      expected_lcm = 144

      get "/euclid/result/?input_1=36&input2=48"

      expect(assigns(:gcd)).to equal(expected_gcd)
      expect(assigns(:lcm)).to equal(expected_lcm)
    end

    it "redirects on invalid query" do
      get "/euclid/result/?input_1='-1'&input2='14'"

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to('/')
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/euclid/index"

      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end
  end

end
