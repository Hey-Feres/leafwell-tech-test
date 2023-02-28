module Onboarding
	class UserInfoController < OnboardingController
		def form
			@fitness_activity_options = User.fitness_activities.keys.map{|fa| [fa.capitalize, fa]}
		end

		def save
			current_user.assign_attributes(user_params)

			if current_user.save
				redirect_to onboarding_user_conditions_form_path
			else
				redirect_to onboarding_user_info_form_path, notice: current_user.errors.messages.map{|k,v| "#{k} #{v[0]}"}.join(', ')
			end
		end

		private

		def user_params
			params.permit(:name, :age, :fitness_activity, :has_insurance)
		end
	end
end