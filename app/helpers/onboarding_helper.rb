module OnboardingHelper
	def title_for_onboarding_index
		if current_user.completed_onboarding?
			'Please Update your Info'
		else
			'Onboarding'
		end
	end

	def content_for_onboarding_index
		if current_user.completed_onboarding?
			'We need to keep your info up to date to deliver the best experience for you'
		else
			'Welcome to Onboarding! We are excited to have you here. With this onboarding, we can understand better your profile and needs'
		end
	end

	def content_for_onboarding_button
		if current_user.completed_onboarding?
			'Update my Info'
		else
			'Get Started'
		end
	end

	def content_for_onboarding_finish_button
		if current_user.completed_onboarding?
			'Finish'
		else
			'Finish Onboarding'
		end
	end
end
