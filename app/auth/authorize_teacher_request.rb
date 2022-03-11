# app/auth/authorize_teacher_request.rb
class AuthorizeTeacherRequest
    def initialize(headers = {})
      @headers = headers
    end
  
    # Service entry point - return valid teacher object
    def call
      {
        teacher: teacher,
      }
    end
  
    private
  
    attr_reader :headers
  
    def teacher
      # check if teacher is in the database
      # memoize teacher object
      @teacher ||= Teacher.find(decoded_auth_token[:teacher_id]) if decoded_auth_token
      # handle teacher not found
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
  