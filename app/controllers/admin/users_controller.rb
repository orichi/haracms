class Admin::UsersController < AdminController

  before_filter :current_page
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    temp = User.find_by_email(session[:email])
    if @user.id == temp.id
    else
      flash[:error] = "Invalid Operation!"
      redirect_to :back
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    temp = User.find_by_email(session[:email])
    if @user.id == temp.id
    else
      flash[:error] = "Invalid Operation!"
      redirect_to :back
    end
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def current_page
      @current = "user"
    end
end
