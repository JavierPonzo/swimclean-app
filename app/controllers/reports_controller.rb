class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    if @report.save
      # Update algae index for the area (average or last reported level)
      area = @report.area
      area.algae_index = calculate_index(area)
      area.save

      redirect_to root_path, notice: "Report submitted!"
    else
      redirect_to root_path, alert: "Failed to submit report."
    end
  end

  private

  def report_params
    params.require(:report).permit(:area_id, :algae_level, :comment)
  end

  def calculate_index(area)
    reports = area.reports.last(5) # or all, if you prefer
    levels = reports.map do |r|
      case r.algae_level
      when "none" then 0
      when "medium" then 1
      when "high" then 2
      end
    end
    levels.sum.to_f / levels.size
  end
end
