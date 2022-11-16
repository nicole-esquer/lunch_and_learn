class ImageService
  def self.images_by_country(country)
    response = conn.get("/search/photos?query=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['unsplash_access_key']
      faraday.params['secret_key'] = ENV['unsplash_secret_key']
    end
  end
end
