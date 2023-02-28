# frozen_string_literal: true

class RelatedQuestionAnswer < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :related_question
end
