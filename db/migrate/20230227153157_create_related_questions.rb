class CreateRelatedQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :related_questions do |t|
      t.string :content
      t.string :related_on_type
      t.integer :related_on_id

      t.timestamps
    end
  end
end
