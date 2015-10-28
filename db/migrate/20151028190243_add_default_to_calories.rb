class AddDefaultToCalories < ActiveRecord::Migration
  def change
    change_column :foods, :calories, :integer, default: 0
  end
end
