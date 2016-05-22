class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all
  end

  # GET /locations/1
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location was successfully created."
      redirect_to @location
    else
      render :new
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      flash[:success] = "Location was successfully updated."
      redirect_to @location
    else
      render :edit
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
    flash[:success] = "Location was successfully deleted."
    redirect_to locations_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :city, :country)
    end
end
