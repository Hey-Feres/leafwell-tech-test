# frozen_string_literal: true

class OnboardingController < ApplicationController
	skip_before_action :redirect_to_questions!

	def index
	end

	def finished
		current_user.answered_questions!
		current_user.completed_onboarding!
	end
end
