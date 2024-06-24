require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /user/new" do
    it "should show information correctly" do
      get user_new_path
      expect(response).to have_http_status :ok
    end
  end

  describe "POST /user/create" do
    it 'should create with correct information' do
      expect {
        post user_create_path , params: { 
          public: "true",
          name: "test",
          email: "a",
          password: "1234"
        }
      }.to change(User, :count).by 1
    end

    it 'should not create with incorrect information' do
      expect {
        post user_create_path, params: {
          name: "",
          email: "",
          password: ""
        }
      }.to_not change(User, :count)
    end

  end
end
