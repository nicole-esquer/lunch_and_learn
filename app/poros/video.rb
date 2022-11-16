class Video
  attr_reader :title,
              :etag

  def initialize(data)
    @etag = data[:etag]
    @title = data[:snippet][:title]
  end
end
