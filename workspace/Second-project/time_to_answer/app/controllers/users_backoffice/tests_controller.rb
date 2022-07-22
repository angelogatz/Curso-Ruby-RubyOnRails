class UsersBackoffice::TestsController < UsersBackofficeController
  before_action :set_results, only: [:results, :show]

  def index
    @user_test = current_user.user_tests
    @tests = Test.all.includes(:subject).includes(:questions)
  end


end