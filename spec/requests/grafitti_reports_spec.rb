require 'rails_helper'

RSpec.describe 'GrafittiReports', type: :request do
  let(:valid_attributes) { {name: 'Pawar', search_date: '09/2018'} }

  describe 'GET /grafitti_reports/create_report' do
    before { get '/grafitti_reports/create_report', params: valid_attributes }

    expected_response =
      {
        'alderman_name'     => 'Ameya Pawar',
        'number_of_reports' => 571,
        'report_month'      => '09/2018',
        'ward_number'       => '47'
      }

    it 'works' do
      expect(JSON.parse(response.body)).to eq expected_response
    end
  end

end