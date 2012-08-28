class AdminController < ApplicationController
  before_filter :current_user
  
  private
    def current_user
      if session[:username]
      else
        flash[:notice] = "Login first"
        redirect_to(session_new_path)
      end
    end
end
