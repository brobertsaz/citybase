class GrafittiReportsController < ApplicationController
  def create_report
    GrafittiReport.generate_report(report_params)
  end

  private

  def report_params
    params.permit(:name, :search_date)
  end
end
