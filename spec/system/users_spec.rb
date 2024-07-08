require 'rails_helper'

RSpec.describe "Users", type: :system do
  include Helpers
  before do
    driven_by(:rack_test)
  end

  describe "#create" do
    it "should create with correct information" do
      visit user_new_path
      
      fill_in "name",     with: "test"
      fill_in "email",    with: "a"
      fill_in "password", with: "1234"
      choose  "公開"

      click_button "新規登録"

      expect(page).to have_content('ユーザー登録成功しました')
    end

    it "should not create with incorrect information" do
      visit user_new_path

      fill_in "name", with: ""
      fill_in "email", with: ""
      fill_in "password", with: ""
      
      click_button "新規登録"

      expect(page).to have_content('ユーザー名 を入力してください')
      expect(page).to have_content('メールアドレス を入力してください')
      expect(page).to have_content('パスワード を入力してください')
    end

  end

  describe '#login' do
    let!(:user) { FactoryBot.create(:user) }
   
    it 'should login with correct information' do
      visit user_login_path
      fill_in "name", with: "test"
      fill_in "password", with: "1234"

      click_button "ログイン"
      expect(page).to have_content('ログインできました')
    end

    it 'should not login with incorrect information' do
      visit user_login_path

      click_button "ログイン"
      expect(page).to have_content('ユーザー名が見つかりません')

      fill_in "name", with: "test"
      click_button "ログイン"
      expect(page).to have_content("パスワードが違います")
    end
  end

  describe '#udpate' do
    before do
      # 必要なファイルをコピー
      FileUtils.cp(Rails.root.join('spec/support/assets/default_user_img.png'), Rails.root.join('app/assets/images/default_user_img.png'))
    end


    let!(:user) { FactoryBot.create(:user) }

    it 'should udpate with correct information' do
      login_as(user)
      expect(page).to have_content('ログインできました')
      visit "/users/#{user.id}/edit"

      attach_file 'trim_img_uploder', Rails.root.join('spec/support/assets/default_user_img.png')
      fill_in "name", with:"test1"
      fill_in "email", with: "abcd"


      click_button "編集"
      
      visit "/users/#{user.id}/edit"
      user_name = find('#user_name').value
      expect(user_name).to eq('test1')
      user_email = find('#user_email').value
      expect(user_email).to eq('abcd')
    end
  end
end
