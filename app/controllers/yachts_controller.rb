class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @yachts = Yacht.all
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.save ? redirect_to(@yacht) : render(:new)
  end

  def yacht_params
     params.require(:yacht).permit(:name, :crew, :description, :address, :max_capacity)
  end

end
