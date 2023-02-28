module Onboarding
	class SymptomsRelatedQuestionsAnswersController < OnboardingController
		def form
			@questions = RelatedQuestion.where(related_on_type: 'Symptom', related_on_id: current_user.symptoms.pluck(:id))
			@user_question_answers = current_user.related_question_answers.select(:related_question_id, :answer)

			redirect_to onboarding_finished_path if @questions.size.zero?
		end

		def save
			questions = params[:question_id]

			answers = []
			questions.keys.each do |question_id|
				answers << RelatedQuestionAnswer.new(user_id: current_user.id, related_question_id: question_id, answer: questions[question_id] == 'true')
			end

			if answers.map(&:valid?).any? false
				redirect_to onboarding_symptom_related_questions_answers_form_path, notice: 'Something went wrong'
			else
				RelatedQuestionAnswer.import(answers)
				redirect_to onboarding_finished_path
			end
		end
	end
end