class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :met
      t.string :description, limit: 1024
      t.integer :position
      t.timestamps
    end
  end
end
