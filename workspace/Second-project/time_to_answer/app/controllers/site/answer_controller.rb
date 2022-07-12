class Site::AnswerController < SiteController
  def question
    @answer = Answer.find(params[:answer_id])
    UserStatisticInfo.set_statistic_info(@answer, current_user)
  end
end
