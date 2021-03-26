class ApplicationController < ActionController::API
  before_action :require_loggin

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def decode_token(token)
    token_splitted = auth_header.split('.')[1]
    JWT.decode(token_splitted,Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
  end
  

  def session_user 
    decoded_hash = decoded_token
    if decoded_token
      user_id = decoded_hash[0]["user_id"]
      @user = User.find(user_id)
    else
      nil
    end
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      begin 
        decode_token(auth_header)
      rescue JWT::DecodeError
      []
      end
    end
  end
  
  def logged_in?
    !!session_user
  end

  def require_loggin
    render json: {message: 'Please loggin'}, status: :unauthorized unless logged_in?
  end

end