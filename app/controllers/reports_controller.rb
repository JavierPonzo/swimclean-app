class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    if @report.save
      area = @report.area
      # Save the raw average, not rounded
      area.update(algae_index: calculate_index(area))
      @areas = Area.all

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Report submitted!" }
      end
    else
      @areas = Area.all
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("map-frame", partial: "shared/map", locals: { areas: @areas }) }
        format.html { render 'areas/index', alert: "Failed to submit report." }
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:area_id, :algae_level, :comment)
  end

  def calculate_index(area)
    reports = area.reports.last(5)
    levels = reports.map do |r|
      case r.algae_level&.downcase
      when "clean" then 0
      when "medium" then 1
      when "high" then 2
      end
    end.compact # remove nils
    return 0 if levels.empty?

    levels.sum.to_f / levels.size
  end
end
