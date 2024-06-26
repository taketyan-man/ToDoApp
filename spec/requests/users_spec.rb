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

  describe 'POST /user/login' do   
    it 'should login with correct information' do
      user =  FactoryBot.create(:user) 
      get user_logout_path
      post user_login_path, params: {
        name:     user.name,
        password: user.password
      }
      expect(response).to redirect_to tasks_path
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
