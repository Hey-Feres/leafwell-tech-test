class UpdateUserAnsweredQuestionFlagWorker
  include Sidekiq::Worker

  def perform
    # scope = User.where('answered_questions_at <= ?', 1.month.ago)
    scope = User.all

    scope.each do |user|
      user.update(answered_questions: false)
    end
  end
end
