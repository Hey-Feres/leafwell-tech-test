# frozen_string_literal: true

class OnboardingController < ApplicationController
	skip_before_action :redirect_to_questions!

	def index
	end

	def user_info
		@fitness_activity_options = User.fitness_activities.keys.map{|fa| [fa.capitalize, fa]}
	end

	def save_user_info
		current_user.assign_attributes(user_params)

		if current_user.save
			redirect_to user_conditions_path
		else
			redirect_to user_info_path, notice: current_user.errors.messages.map{|k,v| "#{k} #{v[0]}"}.join(', ')
		end
	end

	def user_conditions
		@user_condition = UserCondition.new
		@user_conditions_ids = current_user.conditions.pluck(:id)
		@conditions_options = Condition.all.select(:name, :id)
	end

	def save_user_conditions
		conditions_ids = params[:condition_id].select{|k,v|v=="1"}.keys

		conditions = []
		conditions_ids.each do |condition_id|
			conditions << UserCondition.find_or_initialize_by(user_id: current_user.id, condition_id: condition_id)
		end

		if conditions.map(&:valid?).any? false
			redirect_to user_conditions_path, notice: 'Something went wrong'
		else
			UserCondition.import(conditions.filter{|condition| condition.id.nil?})
			redirect_to user_symptoms_path
		end
	end

	def user_symptoms
		@user_symptom = UserSymptom.new
		@user_symptoms_ids = current_user.symptoms.pluck(:id)
		@symptoms_options = Symptom.all.select(:name, :id)
	end

	def save_user_symptoms
		symptoms_ids = params[:symptom_id].select{|k,v|v=="1"}.keys

		symptoms = []
		symptoms_ids.each do |symptom_id|
			symptoms << UserSymptom.find_or_initialize_by(user_id: current_user.id, symptom_id: symptom_id)
		end

		if symptoms.map(&:valid?).any? false
			redirect_to user_symptoms_path, notice: 'Something went wrong'
		else
			UserSymptom.import(symptoms.filter{|condition| condition.id.nil?})
			redirect_to condition_related_questions_answers_path
		end
	end

	def condition_related_questions_answers
		@questions = RelatedQuestion.where(related_on_type: 'Condition', related_on_id: current_user.conditions.pluck(:id))
		@user_question_answers = current_user.related_question_answers.select(:related_question_id, :answer)

		redirect_to onboarding_finished_path if @questions.size.zero?
	end

	def save_condition_related_questions_answers
		questions = params[:question_id]

		answers = []
		questions.keys.each do |question_id|
			answers << RelatedQuestionAnswer.new(user_id: current_user.id, related_question_id: question_id, answer: questions[question_id] == 'true')
		end

		if answers.map(&:valid?).any? false
			redirect_to condition_related_questions_answers_path, notice: 'Something went wrong'
		else
			RelatedQuestionAnswer.import(answers)
			redirect_to symptoms_related_questions_answers_path
		end
	end

	def symptoms_related_questions_answers
		@questions = RelatedQuestion.where(related_on_type: 'Symptom', related_on_id: current_user.symptoms.pluck(:id))
		@user_question_answers = current_user.related_question_answers.select(:related_question_id, :answer)

		redirect_to onboarding_finished_path if @questions.size.zero?
	end

	def save_symptoms_related_questions_answers
	end

	def finished
		current_user.answered_questions!
		current_user.completed_onboarding!
	end

	private

	def user_params
		params.permit(:name, :age, :fitness_activity, :has_insurance)
	end
end
