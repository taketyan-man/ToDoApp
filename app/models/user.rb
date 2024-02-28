class User < ApplicationRecord
  has_many :fights, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :to_dos, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :notices, dependent: :destroy
  mount_uploader :user_image, AvatarUploader
  attr_accessor :image_x
  attr_accessor :image_y
  attr_accessor :image_w
  attr_accessor :image_h
  attr_accessor :aspect_numerator
  attr_accessor :aspect_denominator

  validates :name, presence: {message: "を入力してください"}
  validates :name, length: {maximum: 10, message: "は最大10文字までです"}
  validates :name, uniqueness: {message: "がすでに使われています"}
  validates :email, presence: {message: "を入力してください"}
  validates :password, presence: {message: "を入力してください"}
  validates :public, inclusion: { in: [true, false] }
end
