class SessionController < ApplicationController
  def new
    @user = User.new
  end
  
  def login
    email = params[:user][:email]
    password = params[:user][:password]
    if email && password
      temp = User.where(["email = ? and password=?",params[:user][:email], params[:user][:password]])
      @user = temp.empty? ? nil : temp.first
    else
      redirect_to(root_path)
    end
    if @user
      session[:username] = @user.email
      flash[:notice] = "Login success!"
      redirect_to(admin_root_path)
    else
      redirect_to(root_path)
    end
  end

  def logout
    session[:username]=nil
    redirect_to root_path
  end
end
