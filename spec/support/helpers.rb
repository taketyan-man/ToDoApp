module Helpers
  def login_as(user)
    visit user_login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: user.password
    click_button 'ログイン'
  end
end