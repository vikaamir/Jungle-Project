class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to root_path, notice: 'You have successfully registered and logged in.'
    else
      render :new
    end
  end
 
  def show
    @user = User.find_by(id: params[:id])
    if @user
      # User found, display the user profile
    else
      flash[:alert] = "User not found"
      redirect_to root_path # Redirect to the home page or an error page
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :other_attributes)
  end
end