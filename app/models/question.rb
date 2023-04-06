class Question < ApplicationRecord
  #belongs_to :user
  #has_one :answer

  validates :language, presence: true
  validates :framework, presence: true
  validates :hobby, presence: true
  validates :desired_engineer, presence: true
end
