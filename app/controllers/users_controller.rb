class UsersController < ApplicationController
 def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user.id)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user.destroy!
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :boat_licence)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
