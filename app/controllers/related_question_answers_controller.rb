# frozen_string_literal: true

class RelatedQuestionAnswersController < ApplicationController
  def index
    @conditions = current_user.conditions
    @symptoms = current_user.symptoms
    @question_answers = current_user.related_question_answers.includes(:related_question)
  end
end
