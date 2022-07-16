class UserStatisticInfo < ApplicationRecord
  belongs_to :user
  has_many   :tests

  #Virtual Attributes
  def total_questions
    self.right_questions + self.wrong_questions
  end

  #Class Methods
  def self.set_statistic_info(answer, current_user)
    if !!current_user
      user_statistic_info = UserStatisticInfo.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic_info.right_questions += 1 : user_statistic_info.wrong_questions += 1
      user_statistic_info.save
    end
  end
end
