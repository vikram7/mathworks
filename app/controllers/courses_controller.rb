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
      @course.image_url = "no_image.png"
    end
    if @course.save
      flash[:notice] = "You have successfully added a course."
      redirect_to root_path
    else
      flash[:notice] = "Course was not added. Please fill out all fields."
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
