module Helpers
  module System
    def login_as(user)
      visit login_path
      fill_in 'name', with: user.name
      fill_in 'password', with: user.password
      click_button 'ログイン'
    end
  end
end

RSpec.configure do |config|
  config.include Helpers::System, type: :system
end