require 'rails_helper'

RSpec.describe "Homes", type: :system do
  before do
    driven_by(:rack_test)
    visit home_path
  end

  it 'should show correct link' do
    expect(page).to have_link('新規登録', href: user_new_path)
    expect(page).to have_link('ログイン', href: user_login_path)
  end
end
