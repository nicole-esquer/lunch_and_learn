require 'rails_helper'

RSpec.describe VideoService, type: :service do
  describe '.get_videos(country)', :vcr do
    it 'returns videos for country' do
      videos = VideoService.videos_by_country('laos')
      expect(videos[:items].count).to eq(1)
      expect(videos[:items]).to be_an Array
      expect(videos[:items][0]).to be_a Hash
      expect(videos[:items].first[:etag]).to be_a String
      expect(videos[:items].first[:snippet][:title]).to be_a String
    end
  end
end