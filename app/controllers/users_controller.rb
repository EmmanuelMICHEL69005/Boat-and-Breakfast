class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
 def index

  before_action :set_user, only: :show

  def index

    @users = User.all
  end

  def show

    set_user
    @boat = Boat.new
    @boat.owner = @user
    authorize @boat


    authorize @user
  end



        # @restauran = Restaurant.find(params[:restaurant_id])



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
