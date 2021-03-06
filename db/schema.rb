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

ActiveRecord::Schema.define(version: 20150515114707) do

  create_table "certificates", force: :cascade do |t|
    t.integer  "coach_id",   limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "certificates", ["coach_id"], name: "index_certificates_on_coach_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "coach_cityships", force: :cascade do |t|
    t.integer  "coach_id",   limit: 4
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "coach_cityships", ["city_id"], name: "index_coach_cityships_on_city_id", using: :btree
  add_index "coach_cityships", ["coach_id"], name: "index_coach_cityships_on_coach_id", using: :btree

  create_table "coach_skillships", force: :cascade do |t|
    t.integer  "coach_id",   limit: 4
    t.integer  "skill_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "coach_skillships", ["coach_id"], name: "index_coach_skillships_on_coach_id", using: :btree
  add_index "coach_skillships", ["skill_id"], name: "index_coach_skillships_on_skill_id", using: :btree

  create_table "coach_sportships", force: :cascade do |t|
    t.integer  "coach_id",   limit: 4
    t.integer  "sport_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "coach_sportships", ["coach_id"], name: "index_coach_sportships_on_coach_id", using: :btree
  add_index "coach_sportships", ["sport_id"], name: "index_coach_sportships_on_sport_id", using: :btree

  create_table "coaches", force: :cascade do |t|
    t.string   "coach_name",         limit: 255
    t.integer  "user_id",            limit: 4
    t.text     "description",        limit: 65535
    t.text     "teaching_frame",     limit: 65535
    t.string   "contact_email",      limit: 255
    t.string   "contact_phone",      limit: 255
    t.boolean  "admin_check",                      default: false,   null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "status",             limit: 255,   default: "draft"
    t.string   "sex",                limit: 1
  end

  add_index "coaches", ["status"], name: "index_coaches_on_status", using: :btree
  add_index "coaches", ["user_id"], name: "index_coaches_on_user_id", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.integer  "coach_id",   limit: 4,   null: false
    t.integer  "lesson_id",  limit: 4
    t.string   "content",    limit: 255, null: false
    t.integer  "rating",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["coach_id"], name: "index_comments_on_coach_id", using: :btree
  add_index "comments", ["rating"], name: "index_comments_on_rating", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "coach_id",   limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "experiences", ["coach_id"], name: "index_experiences_on_coach_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "coach_id",           limit: 4,                   null: false
    t.string   "name",               limit: 255,                 null: false
    t.string   "suitable",           limit: 255
    t.text     "content",            limit: 65535
    t.float    "min_price",          limit: 24,    default: 0.0
    t.float    "max_price",          limit: 24,    default: 0.0
    t.string   "attendance",         limit: 255
    t.string   "ps",                 limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  add_index "lessons", ["coach_id"], name: "index_lessons_on_coach_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_uid",                 limit: 255
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.string   "authentication_token",   limit: 255
    t.text     "fb_access_token",        limit: 65535
    t.datetime "fb_expires_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
