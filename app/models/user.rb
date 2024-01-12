class User < ApplicationRecord
  has_many :fights, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :to_dos, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :name, presence: {message: "を入力してください"}
  validates :name, length: {maximum: 10, message: "は最大10文字までです"}
  validates :email, presence: {message: "を入力してください"}
  validates :password, presence: {message: "を入力してください"}
  validates :public,  inclusion: { in: [true, false] }
end
