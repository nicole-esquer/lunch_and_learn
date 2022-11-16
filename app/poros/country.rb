class Country
  attr_reader :name,
              :lat,
              :lng

  def initialize(data)
    @name = data[:name][:common]
    @lat = data[:latlng].first
    @lng = data[:latlng].last
  end
end
