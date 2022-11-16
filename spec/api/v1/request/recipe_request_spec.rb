require 'rails_helper'

RSpec.describe 'Recipe Request' do
  context 'happy path' do
    it 'returns recipe when country is specified', :vcr do
      country = 'thailand'
      get "/api/v1/recipes?country=#{country}"

      results = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(results).to be_a(Hash)
      expect(results).to have_key(:data)
      expect(results[:data]).to be_an(Array)

      data = results[:data][0]

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)

      expect(data).to have_key(:type)
      expect(data[:type]).to eq('recipe')

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      expect(data[:attributes]).to have_key(:title)
      expect(data[:attributes]).to have_key(:url)
      expect(data[:attributes]).to have_key(:country)
      expect(data[:attributes]).to have_key(:image)
    end
  end

  context 'sad path' do
    it 'returns an empty array if country has no corresponding recipes', :vcr do
      country = 'mordor'
      get "/api/v1/recipes?country=#{country}"

      results = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)

      expect(results).to have_key(:data)
      expect(results[:data]).to eq([])
    end

    it 'returns an auto-generated country if country field is empty', :vcr do
      country = ''

      get "/api/v1/recipes?country=#{country}"

      results = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:data)
      expect(results[:data]).to be_an(Array)
    end
  end
end
