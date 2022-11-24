require 'rails_helper'

RSpec.describe "Histories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/histories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/histories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/histories/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/histories/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /pudate" do
    it "returns http success" do
      get "/histories/pudate"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/histories/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/histories/show"
      expect(response).to have_http_status(:success)
    end
  end

end
