class UserMailer < ApplicationMailer
  def update_user_email(current_admin, user)
    @current_admin = current_admin
    @user = user
    mail(to: @user.email, subject: "Seus dados foram alterados!" )
  end
end
