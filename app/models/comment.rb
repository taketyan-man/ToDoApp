class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :todo
  
  has_many :reports, dependent: :destroy
  has_many :notices, dependent: :destroy
end
