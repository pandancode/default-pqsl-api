class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = get_user_from_token
    render json: {
      message: "If you see this, you're in!",
      user: user
    }
  end

  private

  def get_user_from_token
    puts "Hello from get_user_from_token START"
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                            ENV['DEVISE_JWT_SECRET_KEY']).first
    puts "Hello from get_user_from_token before sub"
    user_id = jwt_payload['sub']
    puts user_id
    User.find(user_id.to_s)
  end
end
