require 'rails_helper'

RSpec.describe 'User' do
  it 'returns 201 when a user is created' do
    user_params = {
      "name": 'name',
      "email": 'email@email.com',
      "password": 'password',
      "password_confirmation": 'password'
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(results).to have_key(:type)
    expect(results[:type]).to eq('user')

    expect(results).to have_key(:attributes)

    expect(results[:attributes]).to have_key(:email)
    expect(results[:attributes][:email]).to be_a String

    expect(results[:attributes]).to have_key(:api_key)
  end

  it 'returns an error if passwords do not match' do
    user_params = {
      "name": 'name',
      "email": 'email@email.com',
      "password": 'password',
      "password_confirmation": 'password123'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    expect(response.body).to include('Please try again.')
  end
  it 'returns an error if data is missing' do
    user_params = {
      "email": 'email@email.com',
      "password": 'password'
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to include('Please try again.')
  end
end
