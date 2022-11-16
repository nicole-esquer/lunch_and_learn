class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = VideoFacade.country_videos(params[:country])
    image = ImageFacade.country_images(params[:country])
    render json: LearningResourceSerializer.new(params[:country], video, image)
  end
end
