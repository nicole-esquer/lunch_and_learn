class VideoFacade
  def self.country_videos(country)
    response = VideoService.videos_by_country(country)
    Video.new(response[:items][0])
  end
end
