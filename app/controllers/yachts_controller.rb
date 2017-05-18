class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @yachts = Yacht.all

    if search_params[:city].present?
      @yachts = @yachts.near(search_params[:city])
    end

    if search_params[:capacity].present?
      @yachts = @yachts.where("max_capacity >= ?", search_params[:max_capacity])
    end

    @yachts = @yachts.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@yachts) do |yacht, marker|
      marker.lat yacht.latitude
      marker.lng yacht.longitude
    end
  end

  def show
    @yacht = Yacht.find(params[:id])
    @booking = @yacht.bookings.new
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.save ? redirect_to(@yacht) : render(:new)
  end

  private

  def yacht_params
     params.require(:yacht).permit(:name, :crew, :description, :address, :max_capacity, :photo)
  end

  def search_params
    params.require(:index).permit(:city, :max_capacity)
  end

end
