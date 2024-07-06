require 'rails_helper'

RSpec.describe User, type: :model do
  it 'valid with valid attributes' do
    user = User.new(
      name: "test",
      email: "test@google.com",
      password: 
    )
  end
end