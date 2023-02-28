# frozen_string_literal: true

class User < ApplicationRecord
  # Devise Setup
  devise :database_authenticatable, :registerable, :rememberable, :validatable

	# Enums
	enum fitness_activity: %i[never often everyday]

	# Validations
	validates :age, numericality: { greater_than: 0 }, allow_nil: true

	# Associations
  has_many :user_conditions
  has_many :user_symptoms
  has_many :related_question_answers
  has_many :conditions, through: :user_conditions
  has_many :symptoms, through: :user_symptoms

  def answered_questions?
    answered_questions
  end

  def completed_onboarding?
    completed_onboarding
  end

  def answered_questions!
    update(answered_questions: true)
  end

  def completed_onboarding!
    update(completed_onboarding: true)
  end
end
