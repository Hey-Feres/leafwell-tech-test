# frozen_string_literal: true

class RelatedQuestion < ApplicationRecord
	# Associations
	belongs_to :related_on, polymorphic: true
end
