class SessionsController < ApplicationController
  def new
  end
  def create
  	user = User.find_by_login(params[:login])
    
    if user && User.authenticate(params[:login], params[:password])
  		session[:user_id] = user.id
      redirect_to user_path(User.find_by_id(current_user).login)
    else
      flash.now.alert = "Invalid login or password"
      redirect_to login_path
  	end
  end
  def destroy
  	session[:user_id] = nil
  	render 'sessions/new'
  end
  def show
    @posts = Post.find_by_user_id(current_user)
    @user = current_user
  end
  def find
    @user = User.new
  end
end
