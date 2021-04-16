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

  def index
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      hits = User.where(sql_query, query: "%#{params[:query]}%")
    else
      hits = User.all
    end
    render json: serialized_hits(hits)
  end
  
  private 

  def serialized_hits(hits)
    serialized_hits = hits.map do |user| 
      {
        id: user.id,
        last_name: user.last_name,
        first_name: user.first_name,
        photo_id: user.photo.key
      } 
    end

    serialized_hits
  end

  def user_params
    params.permit(:username, :password, :email)
  end
end
