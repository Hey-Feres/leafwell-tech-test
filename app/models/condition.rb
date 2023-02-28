# frozen_string_literal: true

class Condition < ApplicationRecord
	# Validations
	validates :name, presence: true, allow_blank: false, uniqueness: true
	# Associations
	has_many :related_questions, as: :related_on
end
