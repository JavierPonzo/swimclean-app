class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to root_path, notice: "Thanks for your report!"
    else
      redirect_to root_path, alert: "There was an error"
    end
  end

  private

  def report_params
    params.require(:report).permit(:area_id, :algae_level, :comment)
  end
end
