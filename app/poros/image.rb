class Image
  attr_reader :tag,
              :url

  def initialize(data)
    @tag = data[:alt_description]
    @url = data[:urls][:regular]
  end
end
