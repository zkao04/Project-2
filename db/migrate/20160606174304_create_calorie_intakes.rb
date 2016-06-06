class CreateCalorieIntakes < ActiveRecord::Migration
  def change
    create_table :calorie_intakes do |t|
      t.string :breakfast_description
      t.integer :breakfast
      t.string :lunch_description
      t.integer :lunch
      t.string :dinner_description
      t.integer :dinner
      t.string :snack_description
      t.integer :snack
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
