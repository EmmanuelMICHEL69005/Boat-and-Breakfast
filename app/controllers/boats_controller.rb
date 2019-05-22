class BoatsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show]



   def index
    @boats = policy_scope(Boat)
  end

  def show
    set_boat
  end

  def new
    @boat = record.user.boats.new
    authorize @boat
  end

  def create
    @boat = record.user.boats.new(boat_params)
    authorize @boat
    if @boat.save
    redirect_to @boat
  end
  end

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat.id)
  end

  def destroy
    @boat.destroy!
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :category, :brand, :model, :capacity, :lenght, :price, :picture, :aceesories, :skipper)
  end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end

end
