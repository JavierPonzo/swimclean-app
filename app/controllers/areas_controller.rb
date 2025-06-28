class AreasController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @areas = Area.all
    @area = Area.new
  end

  def create
  @area = Area.new(area_params)

  if current_user&.admin?
    if @area.save
      redirect_to root_path, notice: "Area added"
    else
      render :index, alert: "Error adding area"
    end

  elsif user_signed_in? == false || (current_user && !current_user.admin?)
    @area.algae_index ||= 0
    @area.polygon = []

    if @area.save
      redirect_to root_path, notice: "Thank you for adding a new spot!"
    else
      @areas = Area.all
      render 'pages/index', alert: "Could not add your spot"
    end

  else
    head :unauthorized
  end
end


  private

  def area_params
    params.require(:area).permit(:name, :lat, :lng, :algae_index, polygon: [])
  end
end
