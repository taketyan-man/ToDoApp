class User < ApplicationRecord

  validates :name, presence: {message: "を入力してください"}
  validates :name, length: {maximum: 10}
  validates :email, presence: {message: "を入力してください"}
  validates :password, presence: {message: "を入力してください"}
  has_many :fights, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :to_dos, dependent: :destroy
end
