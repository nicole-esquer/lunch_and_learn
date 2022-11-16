class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceSerializer.new(LearningResourceFacade.learning_resource(country_params[:country]))
  end

  private

  def country_params
    params.permit(:country)
  end
end
