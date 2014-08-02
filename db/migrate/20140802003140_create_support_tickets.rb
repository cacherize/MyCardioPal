class CreateSupportTickets < ActiveRecord::Migration
  def change
    create_table :support_tickets do |t|
      t.belongs_to :user
      t.string :full_name
      t.string :email
      t.string :reason
      t.string :other_reason
      t.text :message
      t.boolean :stickied
      t.datetime :archived_at
      t.timestamps
    end
  end
end
