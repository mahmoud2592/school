# app/auth/authenticate_user.rb
class AuthenticateUser < ApiController
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_reader :email, :password
  
    # verify user credentials
    def user
      if email
        user = User.find_by(email: email)
      end
  
      return user if user&.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise "Authentication Error Released"
    end
  end