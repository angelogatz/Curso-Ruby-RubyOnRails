class UsersBackoffice::WelcomeController < UsersBackofficeController
  def index
    @user_statistic_info = UserStatisticInfo.find_or_create_by(user: current_user)
  end
end
