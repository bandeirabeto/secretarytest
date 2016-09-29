class ClassroomsController < ApplicationController
  before_action :set_params, only: [:new, :create]

  def index
    @classrooms = Classroom.search_all
    respond_with(@classrooms)
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.create(classroom_params)
    respond_with(@classroom, location: classrooms_path)
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    respond_with(@classroom, location: classrooms_path)
  end

  private
    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id)
    end

    # Internal : Busca objetos necessários para criar uma nova matricula
    #
    def set_params
      @students = Student.search_all.active
      @courses = Course.search_all.active
    end
end
