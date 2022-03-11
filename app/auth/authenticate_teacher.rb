# app/auth/authenticate_teacher.rb
class AuthenticateTeacher < ApiTeacherController
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(teacher_id: teacher.id) if teacher
    end
  
    private
  
    attr_reader :email, :password
  
    # verify teacher credentials
    def teacher
      if email
        teacher = Teacher.find_by(email: email)
      end
  
      return teacher if teacher&.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise "Authentication Error Released"
    end
  end