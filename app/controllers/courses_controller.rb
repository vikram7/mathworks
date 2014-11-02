class CoursesController < ApplicationController

  def index
    if params[:search]
      @courses = Course.search(params[:search]).order(:title)
    else
      @courses = Course.order(:title)
    end
  end

  def new
    @course = Course.new
    @sources = Source.all
  end

  def create
    @course = Course.new(course_params)
    if @course.image_url == ""
      @course.image_url = "default.png"
    end
    if @course.save
      flash[:notice] = "Course added successfully!"
      redirect_to courses_path
    else
      flash[:notice] = "Sorry, you didn't enter enough information!"
      @sources = Source.all
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :image_url, :url, :source_id)
  end

end
