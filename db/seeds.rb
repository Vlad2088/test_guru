# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    { name: 'Denis', email: 'denis@yyy.ru', password: '1234', context: 'student' },
    { name: 'Alex', email: 'alex@qqq.ru', password: '4567', context: 'student' },
    { name: 'Victor', email: 'victor@vvv.ru', password: '4789', context: 'student' }
  ]
)

michail = User.create!(name: 'Michail', email: 'michail@yyy.ru', password: 'mi123', context: 'author')
denis = User.create!(name: 'Denis', email: 'denis@cccc.ru', password: '9876', context: 'author')

web = Category.create!(title: 'Web')
desktop = Category.create!(title: 'Desktop')

# Ruby
ruby_test = Test.create!(title: 'Ruby', level: '1', author_id: denis.id, category_id: desktop.id)
ruby_quest = Question.create!(body: 'How do you control Ruby versions on your local machine?', test_id: ruby_test.id)
Answer.create!(
  [
    { body: 'RVM', correct: true, question_id: ruby_quest.id },
    { body: 'NVM', question_id: ruby_quest.id }
  ]
)

# Ruby On Rails
rails_test = Test.create!(title: 'Ruby on Rails', level: '0', author_id: michail.id, category_id: web.id)
rails_quest = Question.create!(body: 'What is has_many?', test_id: rails_test.id)
Answer.create!(
  [
    { body: 'A relationship indicates a one-to-many connection to another model.', correct: true,
      question_id: rails_quest.id },
    { body: 'Link indicates that another model has a link to this model.', question_id: rails_quest.id }
  ]
)

# Python
py_test = Test.create!(title: 'Python', level: '1', author_id: michail.id, category_id: web.id)
py_quest = Question.create!(body: 'Choose immutable built-in types in Python.', test_id: py_test.id)
Answer.create!(
  [
    { body: 'Line, tuple, num.', correct: true, question_id: py_quest.id },
    { body: 'List, sets, dictionary', question_id: py_quest.id }
  ]
)

# C++
cpp_test = Test.create!(title: 'C++', level: '2', author_id: denis.id, category_id: desktop.id)
cpp_quest = Question.create!(body: 'Choose a C++ library.', test_id: cpp_test.id)
Answer.create!(
  [
    { body: 'OpenMB', correct: true, question_id: cpp_quest.id },
    { body: 'SPL', question_id: cpp_quest.id }
  ]
)
