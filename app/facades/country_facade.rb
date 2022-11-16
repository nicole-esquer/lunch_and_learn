class CountryFacade
  def self.country_name
    response = CountryService.country_data
    Country.new(response.sample)
  end
end
