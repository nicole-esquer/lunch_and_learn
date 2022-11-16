require 'rails_helper'

RSpec.describe ImageService, type: :service do
  describe 'image endpoint', :vcr do
    it 'returns images with tag and url' do
      image_response = ImageService.images_by_country('laos')
      expect(image_response).to be_a(Hash)
      expect(image_response).to have_key(:total)
      expect(image_response[:total]).to be_a(Integer)
      expect(image_response).to have_key(:results)
      expect(image_response[:results]).to be_an(Array)

      image_response[:results].each do |image|
        expect(image).to be_a(Hash)
        expect(image).to have_key(:alt_description)
        expect(image[:alt_description]).to be_a(String)
        expect(image).to have_key(:urls)
        expect(image[:urls]).to be_a(Hash)
        expect(image[:urls]).to have_key(:raw)
        expect(image[:urls][:raw]).to be_a(String)
      end
    end
  end
end