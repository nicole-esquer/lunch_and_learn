require 'rails_helper'

RSpec.describe 'Image Facade' do
  it 'returns images', :vcr do
    response = ImageFacade.country_images('laos')

    expect(response).to be_a(Array)
  end
end
