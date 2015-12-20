class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.where(User.arel_table[:username].matches(params[:session][:username].downcase)).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_url
    else
    	flash.now[:danger] = 'Invalid Username/Password combination'
    	render 'users/new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
