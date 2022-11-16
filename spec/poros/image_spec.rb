require 'rails_helper'

RSpec.describe Image do
  describe 'it exists' do
    let(:data) do
      { urls:
        { raw: 'wwww.unisplash.com' },
        alt_description: 'scenic background'}
    end

    it 'has attributes' do
      response = Image.new(data)

      expect(response).to be_instance_of(Image)
      expect(response.url).to eq('wwww.unisplash.com')
      expect(response.tag).to eq('scenic background')
    end
  end
end
