class TeachersController < ApplicationController
    skip_before_action :authorize_teacher_request, only: [:create], :raise => false
    protect_from_forgery with: :null_session
    # REGISTER
    def create
      @teacher = Teacher.create(teacher_params)
      if @teacher.valid?
        token = JsonWebToken.encode(teacher_id: @teacher.id)
        render json: {teacher: @teacher, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    end

  
    private
  
    def teacher_params
      params.permit(:name, :email, :phone, :password)
    end
end
