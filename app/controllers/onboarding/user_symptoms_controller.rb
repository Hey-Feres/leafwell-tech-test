module Onboarding
	class UserSymptomsController < OnboardingController
		def form
			@user_symptom = UserSymptom.new
			@user_symptoms_ids = current_user.symptoms.pluck(:id)
			@symptoms_options = Symptom.all.select(:name, :id)
		end

		def save
			symptoms_ids = params[:symptom_id].select{|k,v|v=="1"}.keys

			symptoms = []
			symptoms_ids.each do |symptom_id|
				symptoms << UserSymptom.find_or_initialize_by(user_id: current_user.id, symptom_id: symptom_id)
			end

			if symptoms.map(&:valid?).any? false
				redirect_to onboarding_user_symptoms_form_path, notice: 'Something went wrong'
			else
				UserSymptom.import(symptoms.filter{|condition| condition.id.nil?})
				redirect_to onboarding_conditions_related_questions_answers_form_path
			end
		end
	end
end