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

  validates :name,     presence:   {message: "を入力してください"}
  validates :name,     length:     {maximum: 10, message: "は最大10文字までです"}
  validates :name,     uniqueness: {message: "がすでに使われています"}
  validates :email,    presence:   {message: "を入力してください"}
  validates :email,    uniqueness: {message: "はすでに登録済みです"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,    format:     { with: VALID_EMAIL_REGEX, message: "を正確に入力してください" }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, message: "が短すぎます" }, if: -> { new_record? || !password.nil? }
  validates :public,   inclusion:  { in: [true, false] }
end
