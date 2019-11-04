class CoursesController < ApplicationController
  def show
    @course = Course.find_by(id: params[:id])
    render file: 'public/404' unless @course
  end
end
