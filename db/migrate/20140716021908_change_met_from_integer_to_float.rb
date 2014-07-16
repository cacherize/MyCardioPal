class ChangeMetFromIntegerToFloat < ActiveRecord::Migration
  def up
    change_column :activities, :met, :float
  end

  def down
    change_column :activities, :met, :integer
  end
end
