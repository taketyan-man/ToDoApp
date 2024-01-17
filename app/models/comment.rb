class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :to_do
  
  has_many :reports, dependent: :destroy
  has_many :notices, dependent: :destroy
end
