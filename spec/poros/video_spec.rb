require 'rails_helper'

RSpec.describe Video do
  describe 'it exists' do
    let(:data) do
      { snippet:
        { title: 'A Super Quick History of Laos' },
        id:
        { videoId: 'uw8hjVqxMXw' } }
    end

    it 'has attributes' do
      response = Video.new(data)
      expect(response).to be_a(Video)
      expect(response.title).to eq('A Super Quick History of Laos')
      expect(response.video_id).to eq('uw8hjVqxMXw')
    end
  end
end
