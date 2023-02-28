# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(name: 'Bruno', age: 23, fitness_activity: 'never', has_insurance: true, insurance_type: 'Insurance 1')

Condition.create(name: 'Acne')
Condition.create(name: 'Anxiety')
Condition.create(name: 'Arrhythmia')
Condition.create(name: 'Bipolar Disorder')
Condition.create(name: 'Cancer')
Condition.create(name: 'Depression')
Condition.create(name: 'Diabetes')

Symptom.create(name: 'Chest Pain')
Symptom.create(name: 'Constipation')
Symptom.create(name: 'Dry Mouth')
Symptom.create(name: 'Fever')
Symptom.create(name: 'Headaches')
Symptom.create(name: 'Heart Palpitations')
Symptom.create(name: 'Indigestion')

RelatedQuestion.create(content: 'Are you using dermatological products?', related_on: Condition.find_by(name: 'Acne'))
RelatedQuestion.create(content: 'Are you taking anxiolytic medicines?', related_on: Condition.find_by(name: 'Anxiety'))
RelatedQuestion.create(content: 'Are you treating anxiety on therapy sessions?', related_on: Condition.find_by(name: 'Anxiety'))
RelatedQuestion.create(content: 'Do you drink alcoholic beverages?', related_on: Condition.find_by(name: 'Arrhythmia'))
RelatedQuestion.create(content: 'Are you taking bipolar disorder medicines?', related_on: Condition.find_by(name: 'Bipolar Disorder'))
RelatedQuestion.create(content: 'Are you doing Chemotherapy treatment?', related_on: Condition.find_by(name: 'Cancer'))
RelatedQuestion.create(content: 'Are you taking antidepressant medicines?', related_on: Condition.find_by(name: 'Depression'))
RelatedQuestion.create(content: 'Are you treating depression on therapy sessions?', related_on: Condition.find_by(name: 'Depression'))
RelatedQuestion.create(content: 'Do you use insulin?', related_on: Condition.find_by(name: 'Diabetes'))

RelatedQuestion.create(content: 'Do you usually drink enegertic drinks?', related_on: Symptom.find_by(name: 'Heart Palpitations'))
RelatedQuestion.create(content: 'Do you usually drink coffee?', related_on: Symptom.find_by(name: 'Heart Palpitations'))
RelatedQuestion.create(content: 'Do you smoke?', related_on: Symptom.find_by(name: 'Dry Mouth'))
RelatedQuestion.create(content: 'Do you get exposed to stress situations frequently?', related_on: Symptom.find_by(name: 'Headaches'))

# UserCondition.create(user_id: User.first.id, condition_id: Condition.find_by(name: 'Anxiety').id)
# Condition.find_by(name: 'Anxiety').related_questions.each do |question|
# 	RelatedQuestionAnswer.create(user_id: User.first.id, related_question_id: question.id, answer: true)
# end
# UserCondition.create(user_id: User.first.id, condition_id: Condition.find_by(name: 'Depression').id)
# Condition.find_by(name: 'Depression').related_questions.each do |question|
# 	RelatedQuestionAnswer.create(user_id: User.first.id, related_question_id: question.id, answer: true)
# end
# UserSymptom.create(user_id: User.first.id, symptom_id: Symptom.find_by(name: 'Headaches').id)
