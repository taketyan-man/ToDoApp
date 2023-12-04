class ToDo < ApplicationRecord
  has_many :fights, dependent: :destroy
  has_many :comments, dependent: :destroy

  def fighted?(user_id)
    fights.where(user_id: user_id).exists?
  end
end