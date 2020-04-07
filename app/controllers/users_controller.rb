class UsersController < ApplicationController


  def new
  end

  def create
    user_params[:email].strip!.downcase!
    user = User.new(user_params)
    if !User.where("email = ?", user_params["email"]).any? && user.save 
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email,
      :password,
      :password_confirmation
    )
  end

end
