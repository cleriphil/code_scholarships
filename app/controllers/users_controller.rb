class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to home_index_path
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = @user.username + " successfully updated!"
      redirect_to home_index_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = @user.name + " was successfully deleted!"
    if current_user == nil
      redirect_to home_index_path
    elsif current_user.admin
      redirect_to users_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :name, :donor, :city, :description, :avatar)
  end
end
