class AddAnsweredQuestionsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :answered_questions, :boolean, default: false
  end
end
