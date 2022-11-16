require 'rails_helper'

RSpec.describe VideoService, type: :service do
  describe 'video endpoint', :vcr do
    it 'returns videos with tag and title' do
      video_response = VideoService.videos_by_country('laos')

      expect(video_response).to be_a(Hash)
      expect(video_response).to have_key(:kind)
      expect(video_response[:kind]).to be_a(String)
      expect(video_response).to have_key(:items)
      expect(video_response[:items]).to be_an(Array)

      video_response[:items].each do |video|
        expect(video).to be_a(Hash)

        expect(video).to have_key(:id)
        expect(video[:id]).to be_a(Hash)
        expect(video[:id]).to have_key(:videoId)
        expect(video[:id][:videoId]).to be_a(String)

        expect(video).to have_key(:snippet)
        expect(video[:snippet]).to be_a(Hash)
        expect(video[:snippet]).to have_key(:title)
        expect(video[:snippet][:title]).to be_a(String)
        expect(video[:snippet]).to have_key(:channelTitle)
        expect(video[:snippet][:channelTitle]).to be_a(String)
      end
    end
  end
end
