require 'rails_helper'

RSpec.describe Country do
  describe 'instantiation' do
    let(:data) do
      { name:
        { common: 'laos' },
        latlng: [17.97, 102.6] }
    end

    it 'instantiates described class' do
      country = Country.new(data)

      expect(country).to be_instance_of(Country)
      expect(country.name).to eq('laos')
      expect(country.lat).to eq(17.97)
      expect(country.lng).to eq(102.6)
    end
  end
end
