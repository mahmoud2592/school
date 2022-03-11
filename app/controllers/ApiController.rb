class ApiController < ActionController::API
    # include Response
    include Pundit
    include ActionController::MimeResponds
    include ExceptionHandler
    # called before every action on controllers
    before_action :authorize_student_request
    attr_reader :current_student
    rescue_from Pundit::NotAuthorizedError, with: :student_not_authorized
  
    private
  
    # Check for valid request token and return student
    def authorize_student_request
      if BlackListToken.find_by_token(request.headers['Authorization'])
        raise "Error Authurization"
      else
        @current_student = AuthorizeStudentRequest.new(request.headers).call[:student]
      end
    end
  
    # rescue from student not authorized
    def student_not_authorized
      raise "Error Student not authorized"
    end
  end