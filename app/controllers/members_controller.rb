class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    p "Begin members_controller#show"
    p "Show current user"
    p current_user
    p "Set user"
    # user = get_user_from_token
    render json: {
      message: "If you see this, you're in members_controller#show!",
      user: current_user
    }
    p "Hello from members_controller#show"
  end

  private

  # def get_user_from_token
  #   # puts "Hello from get_user_from_token START"
  #   jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
  #                           ENV['DEVISE_JWT_SECRET_KEY']).first
  #   # puts "Hello from get_user_from_token before sub"
  #   user_id = jwt_payload['sub']
  #   # puts user_id
  #   User.find(user_id.to_s)
  # end
end
