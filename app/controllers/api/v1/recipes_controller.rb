class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      recipe = RecipeFacade.recipe_details(params[:country])
      render json: RecipeSerializer.new(recipe)
    else
      country = CountryFacade.country_name
      recipe = RecipeFacade.recipe_details(country)
      render json: RecipeSerializer.new(recipe)
    end
  end
end
