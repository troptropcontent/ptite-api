class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    render json: {user: user}
    # if user && user.authenticate(login_params[:password])
    #   payload = {user: user.id}
    #   token = encode_token(payload)
    #   render json: {user: user, token: token}
    # else
    #   render json: {errors: user.errors.full_messages}
    # end
  end

  def persist
    if request.headers['Authorization']
        encoded_token = request.headers['Authorization'].split(' ')[1]
        token = JWT.decode(encoded_token, secret)
        user_id = token[0]['user_id']
        user = User.find(user_id)
        render json: user
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
