# app/controllers/authentication_controller.rb
class AuthenticateTeacherController < ApiTeacherController
    skip_before_action :authorize_teacher_request, only: [:authenticate]
    # return auth token once student is authenticated
    
    

def authenticate
    auth_token =
      AuthenticateTeacher.new(
        auth_params[:email],
        auth_params[:password]
      ).call
    if auth_params[:email]
      teacher = Teacher.find_by(email: auth_params[:email])
    end
    if teacher
      render(
        json: {
          success: true,
          teacher: teacher,
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