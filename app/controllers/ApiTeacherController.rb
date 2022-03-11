class ApiTeacherController < ActionController::API
    # include Response
    include Pundit
    include ActionController::MimeResponds
    include ExceptionHandler
    # called before every action on controllers
    before_action :authorize_teacher_request
    attr_reader :current_teacher
    rescue_from Pundit::NotAuthorizedError, with: :teacher_not_authorized
  
    private
  
    # Check for valid request token and return teacher
    def authorize_teacher_request
      if BlackListToken.find_by_token(request.headers['Authorization'])
        raise "Error Authurization"
      else
        @current_teacher = AuthorizeTeacherRequest.new(request.headers).call[:teacher]
      end
    end
  
    # rescue from teacher not authorized
    def teacher_not_authorized
      raise "Error teacher not authorized"
    end
  end