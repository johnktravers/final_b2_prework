class StudentsController < ApplicationController
  def show
    @student = Student.find_by(id: params[:id])
    render file: 'public/404' unless @student
  end
end
