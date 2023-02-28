# frozen_string_literal: true

class UserSymptom < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :symptom
end
