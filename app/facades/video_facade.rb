class VideoFacade
  def self.country_videos(country)
    response = VideoService.videos_by_country(country)
    response.map do |data|
      Video.new(data)
    end
  end
end
