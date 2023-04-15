class Question < ApplicationRecord
   belongs_to :user
   has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, length: { maximum: 3000 }


end
