class MembersController < ApplicationController
  after_action :authenticate_user!
  # before_action :authenticate_user!

  def show
    p "Current user coming"
    p current_user
    p "Current user done"
    p ENV['DEVISE_JWT_SECRET_KEY']
    render json: { message: "If you see this, you're in!" }
  end
end
