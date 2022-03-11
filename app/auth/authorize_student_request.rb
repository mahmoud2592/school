# app/auth/authorize_student_request.rb
class AuthorizeStudentRequest
    def initialize(headers = {})
      @headers = headers
    end
  
    # Service entry point - return valid student object
    def call
      {
        student: student,
      }
    end
  
    private
  
    attr_reader :headers
  
    def student
      # check if student is in the database
      # memoize student object
      @student ||= Student.find(decoded_auth_token[:student_id]) if decoded_auth_token
      # handle student not found
    rescue ActiveRecord::RecordNotFound => e
      # raise custom error
      raise "Error"
    end
  
    # decode authentication token
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end
  
    # check for token in `Authorization` header
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      end
      return "Error token is missing"
    end
  end
  