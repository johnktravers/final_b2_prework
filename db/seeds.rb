# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

calc = Course.create(name: 'Calculus III')
german = Course.create(name: 'German Linguistics')
history = Course.create(name: 'History of Ancient Civilizations')

duke = Student.create(name: 'Duke Silver')
leslie = Student.create(name: 'Leslie Knope')
april = Student.create(name: 'April Ludgate')

duke.student_courses.create(grade: 85.3, course_id: calc.id)
duke.student_courses.create(grade: 91.0, course_id: history.id)

leslie.student_courses.create(grade: 98.6, course_id: calc.id)
leslie.student_courses.create(grade: 95.3, course_id: german.id)
leslie.student_courses.create(grade: 100.0, course_id: history.id)

april.student_courses.create(grade: 73.4, course_id: german.id)
april.student_courses.create(grade: 82.3, course_id: history.id)
