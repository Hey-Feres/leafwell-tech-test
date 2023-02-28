class UpdateUserAnsweredQuestionFlagWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      user.update(answered_questions: false)
    end
  end
end
