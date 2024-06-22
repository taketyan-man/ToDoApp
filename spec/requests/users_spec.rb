require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /user/new" do
    it "should show information correctly" do
      get user_new_path
      expect(responce).to have_http_status :ok
    end
  end

  describe "POST /user/create" do
    it 'should create with correct information' do
    end
  end
end
