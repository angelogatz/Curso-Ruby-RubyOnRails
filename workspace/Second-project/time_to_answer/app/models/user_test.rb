class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  has_many :test_answers
  has_many :answers, through: :test_answers

  accepts_nested_attributes_for :test_answers
end
