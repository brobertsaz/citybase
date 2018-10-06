require 'rails_helper'

RSpec.describe 'GrafittiReports', type: :request do
  let(:valid_attributes) { {name: 'Pawar', search_date: '09/2018'} }


  describe 'GET /grafitti_reports/create_report' do
    before { get '/grafitti_reports/create_report', params: valid_attributes }

    it 'works' do
      binding.pry
    end
  end

end