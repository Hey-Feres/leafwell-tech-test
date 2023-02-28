class AddAnsweredQuestionsAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :answered_questions_at, :datetime
  end
end
