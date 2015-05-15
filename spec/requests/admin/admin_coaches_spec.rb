require 'rails_helper'

RSpec.describe "Admin::Coaches", type: :request do
  describe "GET /admin_coaches" do
    it "works! (now write some real specs)" do
      get admin_coaches_path
      expect(response).to have_http_status(200)
    end
  end
end
