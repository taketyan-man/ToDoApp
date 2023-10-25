class ToDo < ApplicationRecord
  validates :text, presence: {message: "を入力してください"}
  
end