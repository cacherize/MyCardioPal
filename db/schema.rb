# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140719043610) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.float    "met"
    t.string   "description", :limit => 1024
    t.integer  "position",                    :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "gender",                 :default => "unspecified"
    t.string   "email"
    t.string   "username"
    t.string   "auth_token"
    t.string   "password_digest"
    t.datetime "invitation_sent_at"
    t.boolean  "activated",              :default => false
    t.boolean  "private",                :default => false
    t.datetime "password_reset_sent_at"
    t.string   "password_reset_token"
    t.boolean  "exec",                   :default => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "workouts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "time"
    t.integer  "distance"
    t.float    "incline"
    t.date     "date"
    t.string   "note",        :limit => 2048
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "unit"
  end

end
