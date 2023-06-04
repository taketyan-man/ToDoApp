class User < ApplicationRecord

  validates :name, presence: {message: "を入力してください"}
  validates :email, presence: {message: "を入力してください"}
  validates :password, presence: {message: "を入力してください"}
end
