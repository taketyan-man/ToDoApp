class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :to_do
end
