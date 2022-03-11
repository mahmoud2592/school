class SchedulesController < ApiTeacherController
    before_action :authorize_teacher_request, only: [:create, :index, :show, :destroy]
    # protect_from_forgery with: :null_session

    def index
        schedules = Schedule.all
        render( json: { success: true, schedules: ScheduleSerializer.new(schedules).to_h}, status: :ok )
    end

    def show
        schedule = Schedule.find(params[:id])
        render( json: { success: true, schedule: ScheduleSerializer.new(schedule).to_h }, status: :ok )
    end

    # REGISTER
    def create
      @schedule = Schedule.new
      @schedule.lesson = Lesson.where(id: schedule_params[:lesson_id]).first
      @schedule.timeline = Timeline.where(id: schedule_params[:timeline_id]).first
      @schedule.save!

      if @schedule.valid?
        render json: {scheduale: @schedule}
      else
        render json: {error: "Invalid lesson_id or timeline_id"}
      end
    end

    private
  
    def schedule_params
      params.permit(:lesson_id, :timeline_id)
    end
end
