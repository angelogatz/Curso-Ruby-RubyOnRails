class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :answer
end
