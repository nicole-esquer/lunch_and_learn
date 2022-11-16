class Api::V1::FavoritesController < ApplicationController
  def index
    if params[:api_key].present?
    user = User.find_by(api_key: params[:api_key])
    favorites = user.favorites 
    render json: FavoritesSerializer.new(favorites), status:200
    else
      render json: { errors: "Please try again."}, status: 400
    end
  end

  def create
    if user = User.find_by(api_key: params[:api_key])
      favorite = Favorite.new(favorite_params)
      favorite.user_id = user.id
      favorite.save
      render json: {success: "Favorite added successfully."}, status: 201
    else
      render json: { errors: "Please try again."}, status: 400 
    end
  end
  
  private 
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end
