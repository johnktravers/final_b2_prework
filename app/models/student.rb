class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :courses, through: :student_courses

  def grade_in_course(course)
    student_courses.find_by(course_id: course.id).grade
  end
end
