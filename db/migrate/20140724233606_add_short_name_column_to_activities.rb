class AddShortNameColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :short_name, :string
  end
end
