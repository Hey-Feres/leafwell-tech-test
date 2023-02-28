class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.integer :fitness_activity
      t.boolean :has_insurance, default: false
      t.string :insurance_type

      t.timestamps
    end
  end
end
