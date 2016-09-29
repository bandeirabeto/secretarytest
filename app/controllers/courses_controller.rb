class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.search_all
    respond_with(@courses)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    respond_with(@course, location: courses_path)
  end

  def edit
  end

  def update
    @course.update_attributes(course_params)
    respond_with(@course, location: courses_path)
  end

  def destroy
    @course.destroy
    respond_with(@course, location: courses_path)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :status)
    end
end
