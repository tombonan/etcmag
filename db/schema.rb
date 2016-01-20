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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160120005700) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.integer  "author_id"
    t.integer  "issue_id"
    t.string   "image"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id"
  add_index "articles", ["issue_id"], name: "index_articles_on_issue_id"
  add_index "articles", ["slug"], name: "index_articles_on_slug"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "year"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "authors", ["slug"], name: "index_authors_on_slug"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.integer  "author_id"
    t.string   "image"
  end

  add_index "blogs", ["author_id"], name: "index_blogs_on_author_id"
  add_index "blogs", ["slug"], name: "index_blogs_on_slug"

  create_table "galleries", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.integer  "author_id"
  end

  add_index "galleries", ["author_id"], name: "index_galleries_on_author_id"
  add_index "galleries", ["issue_id"], name: "index_galleries_on_issue_id"
  add_index "galleries", ["slug"], name: "index_galleries_on_slug"

  create_table "issues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "image"
  end

  add_index "issues", ["slug"], name: "index_issues_on_slug"

  create_table "staffs", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
