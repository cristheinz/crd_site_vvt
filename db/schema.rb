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

ActiveRecord::Schema.define(:version => 20140213093020) do

  create_table "packs", :force => true do |t|
    t.integer  "category_id"
    t.boolean  "promo"
    t.boolean  "star"
    t.boolean  "international"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "pdf"
    t.string   "image"
  end

  add_index "packs", ["category_id"], :name => "index_packs_on_category_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "about"
    t.string   "mission"
    t.string   "pillars"
    t.string   "addr1"
    t.string   "addr2"
    t.string   "email"
    t.string   "tel1"
    t.string   "tel2"
    t.string   "tel3"
    t.string   "att"
    t.string   "msg1"
    t.string   "msg2"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "keywords"
    t.string   "description"
    t.string   "rss"
  end

end
