class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :to_do
  has_many :reports, dependent: :destroy
end
