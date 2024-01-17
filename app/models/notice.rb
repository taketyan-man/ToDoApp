class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :to_do
  belongs_to :fight
  belongs_to :report
end
