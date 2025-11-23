require 'rails_helper'

RSpec.describe "Sheets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sheet/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/sheet/show"
      expect(response).to have_http_status(:success)
    end
  end

end
