# app/controllers/authentication_controller.rb
class AuthenticationController < ApiController
    skip_before_action :authorize_user_request, only: [:user_authenticate]
    # return auth token once user is authenticated
  
    def user_authenticate
      auth_token =
        AuthenticateUser.new(
          auth_params[:email],
          auth_params[:password]
        ).call
      if auth_params[:email]
        user = User.find_by(email: auth_params[:email])
      end
      if user
        render(
          json: {
            success: true,
            user: user,
            auth_token: auth_token,
          },
          status: 200
        )
      else
        render(
          json: {
            success: false,
          },
          status: :bad_request
        )
      end
    end
  
    def logout
      black_list_token = BlackListToken.new(token: request.headers['Authorization'])
      if black_list_token.save
        render(
          json: {
            success: true,
          },
          status: 200
        )
      else
        render(
          json: {
            success: false,
          },
          status: :bad_request
        )
      end
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end
  end