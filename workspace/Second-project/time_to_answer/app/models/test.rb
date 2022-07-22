class Test < ApplicationRecord
  belongs_to :subject
  has_many   :test_questions
  has_many   :questions, through: :test_questions
  has_many   :user_tests
  has_many   :users, through: :user_tests


  def self.params_test
    params.require(:form_questions).permit!
  end


end
