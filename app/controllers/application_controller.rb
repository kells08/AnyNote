class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'hello')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'hello', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      User.find_by(user_id)
    end #removed user = User.find_by(id: user_id) from above
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: 'Please log in'},
    status: :unauthorized unless logged_in?
  end

end
