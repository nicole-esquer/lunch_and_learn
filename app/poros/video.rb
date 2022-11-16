class Video
  attr_reader :title,
              :video_id

  def initialize(data)
    @video_id = data[:id][:videoId]
    @title = data[:snippet][:title]
  end
end
