class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :destroy]

  def index
    @students = Student.search_all
    respond_with(@students)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    respond_with(@student, location: students_path)
  end

  def edit
  end

  def update
    @student.update_attributes(student_params)
    respond_with(@student, location: students_path)
  end

  def destroy
    @student.destroy
    respond_with(@student, location: students_path)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end
end
