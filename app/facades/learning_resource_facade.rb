class LearningResourceFacade
  def self.learning_resource(country)
    images = ImageFacade.country_images(country)
    video = VideoFacade.country_videos(country)

    LearningResource.new(images, video, country)
  end
end
