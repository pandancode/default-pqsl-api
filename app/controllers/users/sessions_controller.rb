class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'You are logged in.',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    p "Hitting logout action"
    p current_user
    p "current_user identified?"
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
    p "Successfully signed out"
  end

  def log_out_failure
    render json: { message: 'Logout failed.' }, status: :unauthorized
    p "Signout: failed"
  end
end
