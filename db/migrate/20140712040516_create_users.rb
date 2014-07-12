class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :gender, default: 'unspecified'
      t.string :email
      t.string :username
      t.string :auth_token
      t.string :password_digest
      t.datetime :invitation_sent_at
      t.boolean :activated, default: false
      t.boolean :private, default: false
      t.datetime :password_reset_sent_at
      t.string :password_reset_token
      t.boolean :exec, default: false

      t.timestamps
    end
  end
end
