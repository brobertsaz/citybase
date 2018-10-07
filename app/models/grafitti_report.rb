class GrafittiReport < ApplicationRecord
  def self.generate_report(params)
    @client = SODA::Client.new(domain: (ENV['DATA_DOMAIN']).to_s,
                               app_token: (ENV['SOCRATE_APP_TOKEN']).to_s)

    @wards_response = @client.get((ENV['WARD_OFFICES_DATASET']).to_s)

    search_ward(params)
    search_graffiti(params)

    response = { 'alderman_name' => @ward.alderman,
                 'ward_number' => @ward.ward,
                 'report_month' => params['search_date'],
                 'number_of_reports' => @filtered_graffiti.count }

    response
  end

  private

  def self.search_ward(params)
    pattern = /#{params[:name]}/
    @ward = @wards_response.select { |s| s.alderman =~ pattern }.last
  end

  def self.search_graffiti(params)
    graffiti_response = @client.get((ENV['GRAFFITI_DATASET']).to_s, ward: @ward.ward.to_s)
    start_date = params['search_date'].to_date
    end_date = start_date.end_of_month
    @filtered_graffiti = graffiti_response.select { |g| g.creation_date.to_date >= start_date && g.creation_date.to_date <= end_date }
  end
end
