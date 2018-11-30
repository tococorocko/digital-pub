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

ActiveRecord::Schema.define(version: 2018_11_30_131237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "online", default: false
    t.index ["game_id"], name: "index_chats_on_game_id"
    t.index ["team_id"], name: "index_chats_on_team_id"
  end

  create_table "favorite_leagues", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_favorite_leagues_on_league_id"
    t.index ["user_id"], name: "index_favorite_leagues_on_user_id"
  end

  create_table "favorite_teams", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_favorite_teams_on_team_id"
    t.index ["user_id"], name: "index_favorite_teams_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "team_a_id"
    t.bigint "team_b_id"
    t.bigint "league_id"
    t.datetime "kick_off_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_games_on_league_id"
    t.index ["team_a_id"], name: "index_games_on_team_a_id"
    t.index ["team_b_id"], name: "index_games_on_team_b_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "games"
  add_foreign_key "chats", "teams"
  add_foreign_key "favorite_leagues", "leagues"
  add_foreign_key "favorite_leagues", "users"
  add_foreign_key "favorite_teams", "teams"
  add_foreign_key "favorite_teams", "users"
  add_foreign_key "games", "leagues"
  add_foreign_key "games", "teams", column: "team_a_id"
  add_foreign_key "games", "teams", column: "team_b_id"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
end
