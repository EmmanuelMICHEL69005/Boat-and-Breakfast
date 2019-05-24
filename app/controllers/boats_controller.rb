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
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { boat: boat }),
        image_url: helpers.asset_url('boat.png')
      }
    end
  end

  def show
    set_boat
    @review = Review.new
    @booking = Booking.new
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
