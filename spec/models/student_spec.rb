require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :student_courses }
    it { should have_many(:courses).through(:student_courses) }
  end

  describe 'instance methods' do
    it 'grade in course' do
      greg = Student.create!(name: 'Greg Pikitis')
      calc = Course.create!(name: 'Calculus III')
      greg.student_courses.create!(grade: 87.4, course_id: calc.id)

      expect(greg.grade_in_course(calc)).to eq(87.4)
    end
  end
end
