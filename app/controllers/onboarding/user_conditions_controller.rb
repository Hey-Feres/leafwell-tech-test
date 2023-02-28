module Onboarding
	class UserConditionsController < OnboardingController
		def form
			@user_condition = UserCondition.new
			@user_conditions_ids = current_user.conditions.pluck(:id)
			@conditions_options = Condition.all.select(:name, :id)
		end

		def save
			conditions_ids = params[:condition_id].select{|k,v|v=="1"}.keys

			conditions = []
			conditions_ids.each do |condition_id|
				conditions << UserCondition.find_or_initialize_by(user_id: current_user.id, condition_id: condition_id)
			end

			if conditions.map(&:valid?).any? false
				redirect_to onboarding_user_conditions_form_path, notice: 'Something went wrong'
			else
				UserCondition.import(conditions.filter{|condition| condition.id.nil?})
				redirect_to onboarding_user_symptoms_form_path
			end
		end
	end
end