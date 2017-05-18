class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @yachts = Yacht.near(search_params[:city].downcase)
    @yachts = @yachts.where("max_capacity >= ?", search_params[:max_capacity])
    #@yachts = Yacht.where.not(latitude: nil, longitude: nil)


    #@yachts = Yacht.near(search_params[:city].downcase)
    #@yachts_2 =

    #@yachts = Yacht.where("location LIKE ? AND max_capacity >= ? ",
     # "%#{search_params[:city].downcase}%", search_params[:max_capacity])


    @hash = Gmaps4rails.build_markers(@yachts) do |yacht, marker|
      marker.lat yacht.latitude
      marker.lng yacht.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @yacht = Yacht.find(params[:id])
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
