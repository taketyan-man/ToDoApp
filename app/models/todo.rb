class Todo < ApplicationRecord
  has_many :fights, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :notices, dependent: :destroy
  belongs_to :user

  validates :text, presence: { message: "を入力してください" }
  validates :limit_date, presence: { message: "を入力してください" }
  validate :limit_date_in_past
  validates :fight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comment, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: { in: [true, false] }
  
  def fighted?(user_id)
    fights.where(user_id: user_id).exists?
  end

  private 
    def limit_date_in_past
      if limit_date.present? && limit_date < Date.today
        errors.add(:limit_date, "を過去に設定はできません")
      end
    end
end