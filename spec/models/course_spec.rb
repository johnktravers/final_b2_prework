require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :student_courses }
    it { should have_many(:students).through(:student_courses) }
  end

  describe 'instance methods' do
    it 'students by grade' do
      calc = Course.create!(name: 'Calculus III')

      duke = Student.create!(name: 'Duke Silver')
      leslie = Student.create!(name: 'Leslie Knope')
      april = Student.create!(name: 'April Ludgate')

      calc.student_courses.create!(grade: 87.4, student_id: duke.id)
      calc.student_courses.create!(grade: 93.2, student_id: leslie.id)
      calc.student_courses.create!(grade: 78.3, student_id: april.id)

      expect(calc.students_by_grade).to eq([leslie, duke, april])
    end
  end
end
