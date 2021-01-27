class ApiController < ActionController::API
  # include Response
  include Pundit
  include ActionController::MimeResponds
  # called before every action on controllers
  before_action :authorize_user_request
  attr_reader :current_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # Check for valid request token and return user
  def authorize_user_request
    if BlackListToken.find_by_token(request.headers['Authorization'])
      raise "Error Authurization"
    else
      @current_user = AuthorizeUserRequest.new(request.headers).call[:user]
    end
  end

  # rescue from user not authorized
  def user_not_authorized
    raise "Error User not authorized"
  end
end
