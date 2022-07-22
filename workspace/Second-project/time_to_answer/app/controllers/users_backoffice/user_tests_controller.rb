class UsersBackoffice::UserTestsController < UsersBackofficeController
  
  def new
    @test = Test.find(params[:test_id])
    @user_test = current_user.user_tests.new
    @user_test.test_answers.build
  end

  def create
    @test = Test.find(params[:test_id])
    @user_test = current_user.user_tests.new(params_test)
    @user_test.test = @test
    if @user_test.save!

      redirect_to users_backoffice_test_user_test_path(@user_test, :test_id), notice: "tu finalizou a prova bichão!"
    else
      render "new"
    end
  end

  def show
    @test = Test.find(params[:test_id])
    @user_test = UserTest.find(params[:id])
  end

  private

  def params_test
    params.require(:user_test).permit(:test_id, test_answers_attributes: [:answer_id])
  end

end

  
