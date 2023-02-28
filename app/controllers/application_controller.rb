class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :redirect_to_questions!

	def redirect_to_questions!
		return unless current_user

		return if current_user.answered_questions?

		redirect_to onboarding_path
	end
end
