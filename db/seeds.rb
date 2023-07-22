# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Denis', email: 'denis@yyy.ru', password: '1234', context: 'student' },
                      { name: 'Alex', email: 'alex@qqq.ru', password: '4567', context: 'student' },
                      { name: 'Victor', email: 'victor@vvv.ru', password: '4789', context: 'student'},
                      { name: 'Michail', email: 'michail@yyy.ru', password: 'mi123', context: 'author' },
                      { name: 'Denis', email: 'denis@cccc.ru', password: '9876', context: 'author' }])


categories = Category.create!([{ title: 'Web' },
                               { title: 'Desktop' }])

tests = Test.create!([{ title: 'Ruby on Rails', level: '0', author_id: users[3].id, category_id: categories[0].id },
                       { title: 'Python', level: '1', author_id: users[3].id, category_id: categories[0].id },
                       { title: 'C++', level: '2', author_id: users[4].id, category_id: categories[1].id },
                       { title: 'Ruby', level: '1', author_id: users[4].id, category_id: categories[1].id }])

questions = Question.create!([{ body: 'What is has_many?', test_id: tests[0].id }, 
                              { body: 'Choose immutable built-in types in Python.', test_id: tests[1].id },
                              { body: 'Choose a C++ library.', test_id: tests[2].id },
                              { body: 'How do you control Ruby versions on your local machine?', test_id: tests[3].id }])

Answer.create!([{ body: 'A relationship indicates a one-to-many connection to another model.', correct: true, question_id: questions[0].id },
                { body: 'Link indicates that another model has a link to this model.', question_id: questions[0].id },
                { body: 'Line, tuple, num.', correct: true, question_id: questions[1].id },
                { body: 'List, sets, dictionary', question_id: questions[1].id },
                { body: 'OpenMB', correct: true, question_id: questions[2].id },
                { body: 'SPL', question_id: questions[2].id },
                { body: 'RVM', correct: true, question_id: questions[3].id },
                { body: 'NVM', question_id: questions[3].id }])
                          