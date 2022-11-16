class VideoService
  def self.videos_by_country(country)
    response = conn.get("/youtube/v3/search?part=snippet&channelId=#{ENV['channel_id']}&maxResults=1&q=#{country}&key=#{ENV['youtube_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://youtube.googleapis.com')
  end
end
