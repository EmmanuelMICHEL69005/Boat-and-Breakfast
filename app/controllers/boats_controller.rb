class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boats = policy_scope(Boat)

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
    p current_user
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.owner = current_user
    authorize @boat
    respond_to do |format|
      if @boat.save
        format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
        format.json { render :show, status: :created, location: @boat }
      else
        format.html { render :new }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :category, :brand, :model, :capacity, :lenght, :price, :photo, :aceesories, :skipper)
  end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end
end
