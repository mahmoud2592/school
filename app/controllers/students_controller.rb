class StudentsController < ApplicationController
    skip_before_action :authorize_student_request, only: [:create], :raise => false
    protect_from_forgery with: :null_session
    # REGISTER
    def create
      @student = Student.create(student_params)
      if @student.valid?
        token = JsonWebToken.encode(student_id: @student.id)
        render json: {student: @student, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    end

  
    private
  
    def student_params
      params.permit(:name, :email, :phone, :password)
    end
end
