class CountryService
  def self.country_data
    response = conn.get('/v3.1/all')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://restcountries.com')
  end
end
