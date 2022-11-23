require 'rails_helper'

RSpec.describe "Calculations", type: :request do
  describe "GET /select" do
    it "returns http success" do
      get "/calculations/select"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /total" do
    it "returns http success" do
      get "/calculations/total"
      expect(response).to have_http_status(:success)
    end
  end

end
