class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @yachts = Yacht.all
  end
end
