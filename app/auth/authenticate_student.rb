# app/auth/authenticate_student.rb
class AuthenticateStudent < ApiController
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(student_id: student.id) if student
    end
  
    private
  
    attr_reader :email, :password
  
    # verify student credentials
    def student
      if email
        student = Student.find_by(email: email)
      end
  
      return student if student&.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise "Authentication Error Released"
    end
  end