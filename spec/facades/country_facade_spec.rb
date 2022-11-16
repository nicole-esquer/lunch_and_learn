require 'rails_helper'

RSpec.describe CountryFacade do
  it 'displays a random country name', :vcr do
    response = CountryFacade.country_name

    expect(response).to be_a(Country)
  end
end
