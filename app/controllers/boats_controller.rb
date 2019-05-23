class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boats = policy_scope(Boat)
    @boats = @boats.where(capacity: params[:capacity]) unless params[:capacity].blank?
    @boats = @boats.near(params[:location], 60) unless params[:location].blank?
    @boats = @boats.where(category: params[:boatType]) unless params[:boatType].blank?
    @markers = @boats.where.not(latitude: nil, longitude: nil).map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
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
