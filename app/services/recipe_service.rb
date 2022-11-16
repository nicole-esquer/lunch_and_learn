class RecipeService
  def self.recipes_by_country(country)
    response = conn.get("/api/recipes/v2?type=any&q=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.conn
    Faraday.new('https://api.edamam.com') do |faraday|
      faraday.params['app_id'] = ENV['edamam_application_id']
      faraday.params['app_key'] = ENV['edamam_api_key']
    end
  end
end
