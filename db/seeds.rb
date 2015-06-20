# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "mike", password: "123")
Survey.create(title: "Test", description: "testing", creator_id: 1)
Question.create(survey_id: 1, content: "Do you like Big L?")
Choice.create(question_id: 1, content: "Yes")
User.create(username: "Julia", password: "123")
Selection.create(taker_id: 2, choice_id: 1)
Completedsurvey.create(taker_id: 2, survey_id: 1)
