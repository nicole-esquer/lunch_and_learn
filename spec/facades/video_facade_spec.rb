require 'rails_helper'

RSpec.describe 'Video Facade' do
  it 'returns videos', :vcr do
    response = VideoFacade.country_videos('laos')

    expect(response).to be_a(Video)
  end
end
