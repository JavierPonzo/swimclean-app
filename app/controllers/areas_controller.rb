class AreasController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @areas = Area.all
    @area = Area.new
  end

  def create
    return head :unauthorized unless current_user.admin?
    @area = Area.new(area_params)
    if @area.save
      redirect_to root_path, notice: "Area added"
    else
      render :index, alert: "Error adding area"
    end
  end

  private

  def area_params
    params.require(:area).permit(:name, :lat, :lng, :algae_index, polygon: [])
  end
end
