class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  #before_action :admin_user,     only: :destroy
  
  respond_to :js, :html, :json, only: :search

  def index
    @users = User.all
  end

  def new
    if !logged_in?
  	 @user = User.new
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by_username(params[:id])
    render '/errors/user_not_found' unless @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      @user.update_attribute(:avatar, rand(1..4))
      @user.update_attribute(:color_code, ["#FBB07D", "#89C2F8", "#AEF184", "#FF8D8D", "#FFFF52"].sample)
   	  flash[:success] = "Welcome!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    if current_user.admin? || (current_user == User.find_by_username(params[:id]))
      User.find_by_username(params[:id]).destroy
      flash[:success] = "User deleted"
    end
    redirect_to root_path
  end





  private
    def user_params
      params.require(:user).permit(:username, :password,
                                     :password_confirmation)
    end

end
