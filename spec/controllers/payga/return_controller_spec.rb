require 'rails_helper'

module Payga
  RSpec.describe ReturnController, type: :controller do

    describe "GET #ok" do
      it "returns http success" do
        get :ok
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #fail" do
      it "returns http success" do
        get :fail
        expect(response).to have_http_status(:success)
      end
    end

  end
end
