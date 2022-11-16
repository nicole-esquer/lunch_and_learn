require 'rails_helper'

RSpec.describe 'Learning Resources Request' do
  xit 'returns response with images and video objects', :vcr do
    get '/api/v1/learning_resources?country=laos'

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    data = results[:data]

    expect(data[:type]).to eq([:learning_resource])
    expect(data[:attributes][:country]).to be_a(String)
    expect(data[:attributes][:video]).to be_a(Hash)
    expect(data[:attributes][:images]).to be_a(Array)
  end
end
