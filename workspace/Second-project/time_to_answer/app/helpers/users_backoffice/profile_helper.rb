module UsersBackoffice::ProfileHelper
  def button_color_toggle(user, current_gender)
    @user.user_profile.gender == current_gender ? 'btn-primary' : 'btn-secondary'
    
  end
end
