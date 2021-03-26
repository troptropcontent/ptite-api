class Api::V1::UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    user = User.create(user_params)
      if user.valid?
        # payload = {user_id: user.id}
        # token = JWT.encode(payload, secret,'HS256')
        render json: {message: "New user created, please comfirm the email address"}
      else
        render json: {errors: user.errors.full_messages}
      end

  end
  
  private 

  def user_params
    params.permit(:username, :password, :email)
  end
end
