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

ActiveRecord::Schema.define(version: 2018_05_11_222227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties_jsonb_path_ops", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_messages", force: :cascade do |t|
    t.string "token"
    t.text "to"
    t.string "user_type"
    t.bigint "user_id"
    t.string "mailer"
    t.text "subject"
    t.datetime "sent_at"
    t.datetime "opened_at"
    t.datetime "clicked_at"
    t.index ["token"], name: "index_ahoy_messages_on_token"
    t.index ["user_type", "user_id"], name: "index_ahoy_messages_on_user_type_and_user_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.string "search_keyword"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "charges_money_requests", force: :cascade do |t|
    t.string "token", null: false
    t.integer "amount_cents", default: 0, null: false
    t.boolean "paid", default: false, null: false
    t.bigint "user_id"
    t.text "description"
    t.string "stripe_charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_charge_id"], name: "index_charges_money_requests_on_stripe_charge_id", unique: true
    t.index ["token"], name: "index_charges_money_requests_on_token", unique: true
    t.index ["user_id"], name: "index_charges_money_requests_on_user_id"
  end

  create_table "document_deliveries", force: :cascade do |t|
    t.string "token"
    t.text "description"
    t.datetime "expires_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_document_deliveries_on_token", unique: true
    t.index ["user_id"], name: "index_document_deliveries_on_user_id"
  end

  create_table "news_sources", force: :cascade do |t|
    t.string "source_id"
    t.string "name"
    t.text "description"
    t.string "url"
    t.string "category"
    t.string "language"
    t.string "country"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_news_sources_on_source_id", unique: true
    t.index ["token"], name: "index_news_sources_on_token", unique: true
  end

  create_table "news_top_stories", force: :cascade do |t|
    t.string "token"
    t.string "source_id"
    t.string "author"
    t.string "title"
    t.text "description"
    t.string "story_url"
    t.string "image_url"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_news_top_stories_on_token", unique: true
  end

  create_table "policy_manager_portability_requests", force: :cascade do |t|
    t.integer "user_id"
    t.string "state"
    t.string "attachment"
    t.string "attachment_file_name"
    t.string "attachment_file_size"
    t.datetime "attachment_content_type"
    t.string "attachment_file_content_type"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_policy_manager_portability_requests_on_user_id"
  end

  create_table "policy_manager_terms", force: :cascade do |t|
    t.text "description"
    t.string "rule"
    t.string "state"
    t.datetime "accepted_at"
    t.datetime "rejected_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policy_manager_user_terms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "term_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_policy_manager_user_terms_on_state"
    t.index ["term_id"], name: "index_policy_manager_user_terms_on_term_id"
    t.index ["user_id"], name: "index_policy_manager_user_terms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "provider"
    t.string "uid"
    t.string "member_id"
    t.boolean "send_daily_stories", default: false, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["member_id"], name: "index_users_on_member_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "charges_money_requests", "users"
  add_foreign_key "document_deliveries", "users"
end
