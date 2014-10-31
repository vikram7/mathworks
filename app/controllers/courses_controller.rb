class CoursesController < ApplicationController

  def new
    @course = Course.new
    @sources = Source.all
  end

end
