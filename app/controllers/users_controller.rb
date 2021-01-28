class UsersController < ApiController
  skip_before_action :authorize_user_request, only: [:create]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = JsonWebToken.encode(user_id: @user.id)
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  # # LOGGING IN
  # def login
  #   @user = User.find_by(email: params[:email])

  #   if @user && @user.authenticate(params[:password])
  #     token = encode_token({user_id: @user.id})
  #     render json: {user: @user, token: token}
  #   else
  #     render json: {error: "Invalid email or password"}
  #   end
  # end


  # def auto_login
  #   render json: @user
  # end

  private

  def user_params
    params.permit(:name, :email, :image, :password)
  end
end
