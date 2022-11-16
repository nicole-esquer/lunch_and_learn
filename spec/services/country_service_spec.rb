require 'rails_helper'

RSpec.describe CountryService, type: :service do
  describe 'country data', :vcr do
    it 'returns a list of countries' do
      response = CountryService.country_data

      expect(response).to be_an(Array)
      expect(response[0]).to be_a(Hash)
      expect(response[0][:name]).to be_a(Hash)
      expect(response[0][:name][:common]).to be_a(String)
    end
  end
end
