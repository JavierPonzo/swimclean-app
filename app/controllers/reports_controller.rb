class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    if @report.save
      area = @report.area
      area.update(algae_index: calculate_index(area).round)


      @areas = Area.all
      redirect_to root_path, notice: "Report submitted!"
    else
      @areas = Area.all
      render 'pages/index', alert: "Failed to submit report."
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
