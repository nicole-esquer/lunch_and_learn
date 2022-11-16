class LearningResource
  attr_reader :id,
              :country,
              :video,
              :images

  def initialize(images, video, country)
    @id = nil
    @country = country
    @video = video
    @images = images
  end
end
