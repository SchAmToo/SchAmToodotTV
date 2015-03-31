class UsersController < ApplicationController

  before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:login, :password, :password_confirmation, :email))
    if request.post?  
      if @user.save
        flash[:message] = "Signup successful"
        session[:user_id] = @user.id
        redirect_to user_path(User.find_by_id(current_user).login)
      else
        flash[:warning] = "Signup unsuccessful"
        render 'users/new'
      end
    end
  end
  def update
    @user = User.find(params[:id])
    if request.post? 
      if params[:commit] == 'Change Password'
        if params[:user].permit[:new_password] == params[:user].permit[:new_password_confirmation]
          @user.change_password(params[:user].permit[:new_password])
          redirect_to user_edit_path(@user)
        else
          flash[:warning] = "Passwords don't match!"
        end
        redirect_to user_path( @user )
      elsif params[:commit] == 'Change Privacy'
        @user.update(privacy: true)
        flash[:warning] = "Privacy Changed!"
        redirect_to user_path( @user )
      end
    end
      #edit privacy
      #see email
      #edit password
  end
  def edit
      @user = User.find(params[:id])
      
  end
  def show
      if User.find_by_login(params[:login]).nil? 
        redirect_to log_in_path
      else
        @user = User.find_by_login(params[:login])
      end
  end
  def index
    @users = User.all
  end
  def forgot_password
    if request.post?
      u= User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:warning]  = "Couldn't send password"
      end
    end
  end

  def change_password
    @user=session[:user]
    if request.post?
      @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:message]="Password Changed"
      end
    end
  end

  def welcome
  end
  def hidden
  end
end