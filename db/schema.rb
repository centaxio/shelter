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

ActiveRecord::Schema.define(version: 20160714150259) do

  create_table "accesses", force: :cascade do |t|
    t.string   "code",       limit: 1
    t.string   "comment",    limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "project_members", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["role_id"], name: "index_project_members_on_role_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "project_roles", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_roles_on_project_id"
    t.index ["role_id"], name: "index_project_roles_on_role_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id",                               null: false
    t.string   "name",       limit: 20,                 null: false
    t.boolean  "deleted",               default: false, null: false
    t.boolean  "public",                default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["name"], name: "index_projects_on_name", unique: true
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "k",          null: false
    t.string   "v",          null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["k"], name: "index_properties_on_k"
    t.index ["v"], name: "index_properties_on_v"
  end

  create_table "replication_jobs", force: :cascade do |t|
    t.string   "status",                limit: 64,    null: false
    t.integer  "replication_policy_id",               null: false
    t.string   "repository",            limit: 256,   null: false
    t.string   "operation",             limit: 64,    null: false
    t.string   "tags",                  limit: 16384
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["replication_policy_id"], name: "index_replication_jobs_on_replication_policy_id"
  end

  create_table "replication_policies", force: :cascade do |t|
    t.string   "name",        limit: 256
    t.integer  "project_id"
    t.integer  "target_id",                              null: false
    t.boolean  "enabled",                 default: true, null: false
    t.text     "description"
    t.string   "cron_str",    limit: 256
    t.datetime "start_time"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["project_id"], name: "index_replication_policies_on_project_id"
  end

  create_table "replication_targets", force: :cascade do |t|
    t.string   "name",        limit: 64
    t.string   "url",         limit: 64
    t.string   "username",    limit: 40
    t.string   "password",    limit: 40
    t.integer  "target_type",            default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "mask",                  default: 0, null: false
    t.string   "code",       limit: 20
    t.string   "name",       limit: 20
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "user_project_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["project_role_id"], name: "index_user_project_roles_on_project_role_id"
    t.index ["user_id"], name: "index_user_project_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 15
    t.string   "email",           limit: 30
    t.string   "password_digest",                            null: false
    t.string   "realname",        limit: 20,                 null: false
    t.string   "comment",         limit: 30
    t.boolean  "deleted",                    default: false, null: false
    t.string   "reset_uuid",      limit: 40
    t.integer  "sysadmin_flag"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
