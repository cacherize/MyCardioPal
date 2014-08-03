class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :question
      t.text :answer
      t.integer :position, default: 0
      t.timestamps
      t.datetime :archived_at
    end
  end
end
