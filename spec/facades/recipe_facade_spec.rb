require 'rails_helper'

RSpec.describe RecipeFacade do
  it 'displays recipe details', :vcr do
    response = RecipeFacade.recipe_details('peru')
    
    expect(response[0] ).to be_a(Recipe)
    expect(response.count).to eq(20)
    expect(response[0].title).to be_a(String)
    expect(response[0].image).to be_a(String)
    expect(response[0].url).to be_a(String)
  end
end
