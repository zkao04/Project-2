class AddDateToCalorieIntakes < ActiveRecord::Migration
  def change
    add_column :calorie_intakes, :date, :datetime
  end
end
