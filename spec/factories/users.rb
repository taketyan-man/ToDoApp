FactoryBot.define do
  factory :user do
    name     { 'test' }
    email    { 'a' }
    public   { 'true' }
    password { '1234' }
  end
end