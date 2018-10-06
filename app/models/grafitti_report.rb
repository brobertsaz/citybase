class GrafittiReport < ApplicationRecord

  def self.generate_report(params)
    client = SODA::Client.new({domain: "#{ENV['DATA_DOMAIN']}", app_token: "#{ENV['SOCRATE_APP_TOKEN']}"})
    binding.pry
    graffiti_response = client.get("#{ENV['GRAFFITI_DATASET']}", {"$limit" => 10})
  end
end
