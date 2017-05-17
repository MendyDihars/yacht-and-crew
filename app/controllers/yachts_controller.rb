class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @yachts = Yacht.where("location LIKE ? AND max_capacity >= ? ",
      "%#{search_params[:city].downcase}%", search_params[:max_capacity])
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
