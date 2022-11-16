require 'rails_helper'

RSpec.describe 'Sessions ' do
  it 'stores sessions when user credentials are valid' do
    user = User.create!(name: 'name', email: 'email@email.com', password: 'password', api_key: '123456789')
    session_params = {
      "email": 'email@email.com',
      "password": 'password'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(session_params)

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(results).to have_key(:type)
    expect(results[:type]).to eq('user')

    expect(results).to have_key(:attributes)

    expect(results[:attributes]).to have_key(:email)
    expect(results[:attributes][:email]).to be_a(String)
    expect(results[:attributes][:email]).to eq(user.email)

    expect(results[:attributes]).to have_key(:api_key)
    expect(results[:attributes][:api_key]).to eq(user.api_key)
  end
  it 'returns an error if passwords do not match' do
    user = User.create!(name: 'name', email: 'email@email.com', password: 'password', api_key: '123456789')
    session_params = {
      "email": 'email@email.com',
      "password": 'password1'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(session_params)

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
