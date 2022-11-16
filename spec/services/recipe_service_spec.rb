require 'rails_helper'

RSpec.describe RecipeService, type: :service do
  describe 'recipes by country', :vcr do
    it 'displays recipes information by country' do
      response = RecipeService.recipes_by_country("laos")

      expect(response[:hits]).to be_an(Array)

      recipe_data = response[:hits][0][:recipe]

      expect(recipe_data).to have_key(:label)
      expect(recipe_data[:label]).to be_a(String)

      expect(recipe_data).to have_key(:image)
      expect(recipe_data[:image]).to be_a(String)

      expect(recipe_data).to have_key(:url)
      expect(recipe_data[:url]).to be_a(String)
    end
  end
end