class GrafittiReportsController < ApplicationController
  def create_report
    @report = GrafittiReport.generate_report(report_params)
    render json: @report
  end

  private

  def report_params
    params.permit(:name, :search_date)
  end
end
