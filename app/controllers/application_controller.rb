class ApplicationController < ActionController::API
  before_action :require_login
  
  # check if the request is authentified (the hearder contains the Authorization:token)
  def auth_header
    request.headers['Authorization']
  end
  # decode the token contained in the header authorisation
  def decoded_token
    if auth_header()
       token = auth_header.split(' ')[1]
       begin
          JWT.decode(token,secret, true, algorithm: 'HS256')
       rescue JWT::DecodeError
          nil
       end
    end
  end
  # render the user based on the token contained in the header decoded by the method decoded_token 
  def current_user
    if decoded_token()
       user_id = decoded_token[0]['user_id']
       @user = User.find(user_id)
    end
  end
  def logged_in?
    !!current_user
  end
  
  # for auth and users controller, check if the request is logged in and if not prompt to do so
  def require_login
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def secret
    return Rails.application.credentials.secret_key_base
  end

end