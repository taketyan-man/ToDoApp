require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/new" do
    it "should show information correctly" do
      get new_user_path
      expect(response).to have_http_status :ok
    end
  end

  describe "POST /users" do
    it 'should create with correct information' do
      expect {
        post create_user_path , params: { 
          public: "true",
          name: "test",
          email: "test@google.com",
          password: "123456"
          password_confirmation: "123456"
        }
      }.to change(User, :count).by 1
    end

    it 'should not create with incorrect information' do
      expect {
        post create_user_path, params: {
          name: "",
          email: "",
          password: ""
          password_confirmation: ""
        }
      }.to_not change(User, :count)
    end
  end

  describe 'POST /login' do   
    it 'should login with correct information' do
      user =  FactoryBot.create(:user) 
      get user_logout_path
      post user_login_path, params: {
        name:     user.name,
        password: user.password
      }
      expect(response).to redirect_to todos_path
      follow_redirect!
      expect(response.body).to include('ログインできました')
    end

    it 'should not login with incorrect information' do
      user = FactoryBot.create(:user)
      get user_logout_path
      post user_login_path, params: {
        name:     "test",
        password: ""
      }
      expect(response).to redirect_to user_login_path
      follow_redirect!
      expect(response.body).to include('パスワードが違います')
    end

    it 'should not login if not create user yet' do
      post user_login_path, params: {
        name:      "テスト",
        password:  "1234"
      }
      expect(response).to redirect_to user_login_path
      follow_redirect!
      expect(response.body).to include('ユーザー名が見つかりません')
    end
  end
end
