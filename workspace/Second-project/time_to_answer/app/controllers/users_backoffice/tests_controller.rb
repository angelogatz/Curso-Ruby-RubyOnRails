class UsersBackoffice::TestsController < UsersBackofficeController
  before_action :set_results, only: [:results, :show]

  def index
    @user = User.find(current_user.id)
    @tests = Test.all.includes(:subject).includes(:questions)
  end


end