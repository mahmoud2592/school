class LessonsController < ApiTeacherController
    before_action :authorize_teacher_request, only: [:create, :index, :show, :destroy]
    # protect_from_forgery with: :null_session

    def index
        lessons = Lesson.all
        render( json: { success: true, lessons: LessonSerializer.new(lessons).to_h}, status: :ok )
    end

    def show
        lesson = Lesson.find(params[:id])
        render( json: { success: true, lesson: LessonSerializer.new(lesson).to_h }, status: :ok )
    end

    # REGISTER
    def create
      
      @lesson = Lesson.create(lesson_params)
      if @lesson.valid?
        render json: {lesson: @lesson}
      else
        render json: {error: "Invalid subject or duration"}
      end
    end

    private
  
    def lesson_params
      params.permit(:subject, :duration)
    end
end
