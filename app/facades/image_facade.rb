class ImageFacade
  def self.country_images(country)
    response = ImageService.images_by_country(country)
    response[:results].map do |data|
      Image.new(data)
    end
  end
end
