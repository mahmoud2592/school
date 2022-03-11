class TimelinesController < ApiTeacherController
    before_action :authorize_teacher_request, only: [:create, :index, :show, :destroy]
    # protect_from_forgery with: :null_session

    def index
        timelines = Timeline.all
        render( json: { success: true, timelines: TimelineSerializer.new(timelines).to_h}, status: :ok )
    end

    def show
        timeline = Timeline.find(params[:id])
        render( json: { success: true, timeline: TimelineSerializer.new(timeline).to_h }, status: :ok )
    end

    # REGISTER
    def create
      
      @timeline = Timeline.new(timeline_params)
      @timeline.teacher = current_teacher
      @timeline.save!
      if @timeline.valid?
        render json: {timeline: @timeline}
      else
        render json: {error: "Invalid from or to"}
      end
    end

    private
  
    def timeline_params
      params.permit(:from, :to)
    end
end
