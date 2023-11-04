# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    { first_name: 'Denis', last_name: 'Probnikov', email: 'denis@yyy.ru', password: '123456' },
    { first_name: 'Alex', last_name: 'Probnikov', email: 'alex@qqq.ru', password: '456789' },
    { first_name: 'Victor', last_name: 'Probnikov', email: 'victor@vvv.ru', password: '478910' }
  ]
)

michail = User.create!(first_name: 'Michail', last_name: 'Probnikov', email: 'michail@yyy.ru', password: 'mi1234')
denis = Admin.create!(first_name: 'Denis', last_name: 'Probnikov', email: 'denis@cccc.ru', password: '987654')

web = Category.create!(title: 'Web')
desktop = Category.create!(title: 'Desktop')

# Ruby
ruby_test = Test.create!(title: 'Ruby', level: '1', author: denis, category: desktop)
ruby_quest = Question.create!(body: 'How do you control Ruby versions on your local machine?', test: ruby_test)
Answer.create!(
  [
    { body: 'RVM', correct: true, question: ruby_quest },
    { body: 'NVM', question: ruby_quest }
  ]
)

# Ruby On Rails
rails_test = Test.create!(title: 'Ruby on Rails', level: '0', author: michail, category: web)
rails_quest = Question.create!(body: 'What is has_many?', test: rails_test)
Answer.create!(
  [
    { body: 'A relationship indicates a one-to-many connection to another model.', correct: true,
      question: rails_quest },
    { body: 'Link indicates that another model has a link to this model.', question: rails_quest }
  ]
)

# Python
py_test = Test.create!(title: 'Python', level: '1', author: michail, category: web)
py_quest = Question.create!(body: 'Choose immutable built-in types in Python.', test: py_test)
Answer.create!(
  [
    { body: 'Line, tuple, num.', correct: true, question: py_quest },
    { body: 'List, sets, dictionary', question: py_quest }
  ]
)

# C++
cpp_test = Test.create!(title: 'C++', level: '2', author: denis, category: desktop)
cpp_quest = Question.create!(body: 'Choose a C++ library.', test: cpp_test)
Answer.create!(
  [
    { body: 'OpenMB', correct: true, question: cpp_quest },
    { body: 'SPL', question: cpp_quest }
  ]
)
