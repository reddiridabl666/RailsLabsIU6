require 'rails_helper'

RSpec.describe "Proxies", type: :request do
  describe "GET /output" do
    it 'returns html when "server" side is chosen' do
      get output_path, params: { input1: 36, input2: 48, side: 'server' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      end

    it 'returns xml when "client" side is chosen' do
      get output_path, params: { input1: 36, input2: 48, side: 'client' }
      expect(response.content_type).to eq 'application/xml; charset=utf-8'
    end
  end
end
