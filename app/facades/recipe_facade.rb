class RecipeFacade
  def self.recipe_details(country)
    response = RecipeService.recipes_by_country(country)
    response[:hits].map do |data|
      Recipe.new(data, country)
    end
  end
end
