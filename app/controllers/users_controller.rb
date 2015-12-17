class UsersController < ApplicationController
  def new
    if !logged_in?
  	 @user = User.new
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
   	  flash[:success] = "Welcome!"
      redirect_to root_path
    else
      render 'new'
    end
  end



  private
    def user_params
      params.require(:user).permit(:username, :password,
                                     :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
