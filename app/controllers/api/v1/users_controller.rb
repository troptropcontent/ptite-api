class Api::V1::UsersController < ApplicationController
  def create
    # render json: {params: user_params}
    user = User.create(user_params)
    
    if user.valid?
      payload = {user: user.id}
      token = encode_token(payload)
      render json: {user: user, token: token}
    else
      render json: {error: user.errors}, status: not_acceptable 
    end
    
  end
  
  private 
  def user_params
    params.permit(:username, :password, :email)
  end
end
