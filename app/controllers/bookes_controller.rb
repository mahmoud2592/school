class BookesController < ApiController
    before_action :authorize_student_request, only: [:create, :index, :show, :destroy]
    # protect_from_forgery with: :null_session

    def index
        bookes = Booke.all
        render( json: { success: true, books: BookeSerializer.new(bookes).to_h}, status: :ok )
    end

    def show
        book = Booke.find(params[:id])
        render( json: { success: true, book: BookeSerializer.new(book).to_h }, status: :ok )
    end

    # REGISTER
    def create
      if !params[:schedule_id].present?
        render json: {error: "Invalid schedule_id"}
      end

      booke = Booke.where(schedule_id: params[:schedule_id]).first
      if booke.nil?
        @book = Booke.new
        @book.schedule = Schedule.where(id: params[:schedule_id]).first
        @book.student = Student.where(id: current_student.id).first
        @book.save!
  
        if @book.valid?
          render json: {book: @book}
        else
          render json: {error: "Invalid schedule_id"}
        end
      else
        render json: {error: "This schedule_id already booked"}
      end
    end

end
