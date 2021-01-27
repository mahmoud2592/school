class HealthCheckController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    skip_before_action :authorize_user_request, raise: false
  
    def index
      render(plain: "OK")
    end
  end