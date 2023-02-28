# frozen_string_literal: true

class Symptom < ApplicationRecord
	# Validations
	validates :name, presence: true, allow_blank: false
	# Associations
	has_many :related_questions, as: :related_on
end
