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

ActiveRecord::Schema.define(version: 20170511230341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "publication_id"
    t.integer  "user_id"
    t.index ["publication_id"], name: "index_comments_on_publication_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "match_id"
    t.index ["match_id"], name: "index_goals_on_match_id", using: :btree
    t.index ["user_id"], name: "index_goals_on_user_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.string   "date",          null: false
    t.string   "result"
    t.integer  "visitor_id"
    t.integer  "local_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree
  end

  create_table "participates", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.integer  "match_id"
    t.index ["match_id"], name: "index_participates_on_match_id", using: :btree
    t.index ["tournament_id"], name: "index_participates_on_tournament_id", using: :btree
  end

  create_table "publications", force: :cascade do |t|
    t.text     "content",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_publications_on_user_id", using: :btree
  end

  create_table "team_invitations", force: :cascade do |t|
    t.string   "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "group"
    t.integer  "dueno_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "shield_file_name"
    t.string   "shield_content_type"
    t.integer  "shield_file_size"
    t.datetime "shield_updated_at"
    t.index ["name"], name: "index_teams_on_name", unique: true, using: :btree
  end

  create_table "tournament_invitations", force: :cascade do |t|
    t.string   "texto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "team_id"
    t.integer  "tournament_id"
    t.index ["team_id"], name: "index_tournament_invitations_on_team_id", using: :btree
    t.index ["tournament_id"], name: "index_tournament_invitations_on_tournament_id", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["name"], name: "index_tournaments_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_tournaments_on_user_id", using: :btree
  end

  create_table "user_invitations", force: :cascade do |t|
    t.string   "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "team_id"
    t.index ["team_id"], name: "index_user_invitations_on_team_id", using: :btree
    t.index ["user_id"], name: "index_user_invitations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "lastname",        null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "team_id"
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  add_foreign_key "comments", "publications"
  add_foreign_key "comments", "users"
  add_foreign_key "goals", "matches"
  add_foreign_key "goals", "users"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "participates", "matches"
  add_foreign_key "participates", "tournaments"
  add_foreign_key "publications", "users"
  add_foreign_key "tournament_invitations", "teams"
  add_foreign_key "tournament_invitations", "tournaments"
  add_foreign_key "tournaments", "users"
  add_foreign_key "user_invitations", "teams"
  add_foreign_key "user_invitations", "users"
  add_foreign_key "users", "teams"
end
