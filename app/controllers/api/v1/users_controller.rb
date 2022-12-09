class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if User.find_by(email: params[:email])
      render json: { errors: 'Please try again.' }, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: { errors: 'Please try again.' }, status: 400
    else
      user.save
      render json: UserSerializer.new(user), status: 201
    end
  end





  
  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :api_key)
  end
end
