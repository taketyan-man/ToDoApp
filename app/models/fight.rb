class Fight < ApplicationRecord
  belongs_to :user
  belongs_to :to_do

  has_many :notices, dependent: :destroy
end
