class CreateUserConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_conditions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
