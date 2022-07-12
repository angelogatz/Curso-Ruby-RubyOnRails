class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @total_users = AdminStatisticInfo.total_users
    @total_questions = AdminStatisticInfo.total_questions
  end
end
