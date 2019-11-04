require 'rails_helper'

RSpec.describe 'Student show page' do
  before :each do
    @greg = Student.create!(name: 'Greg Pikitis')

    @calc = Course.create!(name: 'Calculus III')
    @german = Course.create!(name: 'German Linguistics')
    @history = Course.create!(name: 'History of Ancient Civilizations')

    @greg.student_courses.create!(grade: 87.4, course_id: @calc.id)
    @greg.student_courses.create!(grade: 93.2, course_id: @german.id)
    @greg.student_courses.create!(grade: 78.3, course_id: @history.id)
  end

  it 'can see the student\'s name, courses, and grades' do
    visit "/students/#{@greg.id}"

    expect(page).to have_content('Greg Pikitis')

    within "#course-#{@calc.id}" do
      expect(page).to have_content('Calculus III')
      expect(page).to have_content('Grade: 87.4')
    end

    within "#course-#{@german.id}" do
      expect(page).to have_content('German Linguistics')
      expect(page).to have_content('Grade: 93.2')
    end

    within "#course-#{@history.id}" do
      expect(page).to have_content('History of Ancient Civilizations')
      expect(page).to have_content('Grade: 78.3')
    end
  end

  it 'cannot go to a show page for a student that does not exist' do
    visit '/students/31'

    expect(page).to have_content('The page you were looking for doesn\'t exist (404)')
  end

end
