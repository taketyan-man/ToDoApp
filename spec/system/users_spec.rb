require 'rails_helper'

RSpec.describe "Users", type: :system do
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
end
