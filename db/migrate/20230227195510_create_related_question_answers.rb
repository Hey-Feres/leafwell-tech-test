class CreateRelatedQuestionAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :related_question_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :related_question, null: false, foreign_key: true
      t.boolean :answer, default: false

      t.timestamps
    end
  end
end
