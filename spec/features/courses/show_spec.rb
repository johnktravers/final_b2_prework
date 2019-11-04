require 'rails_helper'

RSpec.describe 'Course show page' do
  before :each do
    @calc = Course.create!(name: 'Calculus III')

    @duke = Student.create!(name: 'Duke Silver')
    @leslie = Student.create!(name: 'Leslie Knope')
    @april = Student.create!(name: 'April Ludgate')

    @calc.student_courses.create!(grade: 87.4, student_id: @duke.id)
    @calc.student_courses.create!(grade: 93.2, student_id: @leslie.id)
    @calc.student_courses.create!(grade: 78.3, student_id: @april.id)
  end

  it 'can see the course name and students ordered by grade' do
    visit "/courses/#{@calc.id}"

    expect(page).to have_content('Calculus III')

    within '#student-0' do
      expect(page).to have_content('Leslie Knope (93.2)')
    end

    within '#student-1' do
      expect(page).to have_content('Duke Silver (87.4)')
    end

    within '#student-2' do
      expect(page).to have_content('April Ludgate (78.3)')
    end
  end

  it 'cannot go to a show page for a course that does not exist' do
    visit '/courses/24'

    expect(page).to have_content('The page you were looking for doesn\'t exist (404)')
  end
end
