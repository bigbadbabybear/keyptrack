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

ActiveRecord::Schema.define(:version => 20120731064129) do

  create_table "builds", :force => true do |t|
    t.integer  "game_id"
    t.integer  "platform_id"
    t.string   "commit"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "builds", ["game_id"], :name => "index_builds_on_game_id"
  add_index "builds", ["platform_id"], :name => "index_builds_on_platform_id"

  create_table "games", :force => true do |t|
    t.string   "title"
    t.string   "key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "platforms", :force => true do |t|
    t.string   "os"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "platform_id"
    t.integer  "status_id"
    t.integer  "resolution_id"
    t.string   "fix_commit"
    t.string   "fix_confirm"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "report_key"
  end

  add_index "reports", ["game_id"], :name => "index_reports_on_game_id"
  add_index "reports", ["platform_id"], :name => "index_reports_on_platform_id"
  add_index "reports", ["resolution_id"], :name => "index_reports_on_resolution_id"
  add_index "reports", ["status_id"], :name => "index_reports_on_status_id"
  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"

  create_table "resolutions", :force => true do |t|
    t.string   "resolution"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
