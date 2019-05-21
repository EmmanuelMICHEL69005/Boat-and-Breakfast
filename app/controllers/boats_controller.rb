class BoatsController < ApplicationController
   def index
    @boats = boat.all
  end

  def show
  end

  def new
    @boat = boat.new
  end

  def create
    boat = boat.create!(boat_params)
    redirect_to boat_path(boat.id)
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
    @boat = boat.find(params[:id])
  end

end
