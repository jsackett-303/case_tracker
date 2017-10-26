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

ActiveRecord::Schema.define(version: 20171026192623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "prefix"
    t.string "street"
    t.string "apartment"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.date "date_of_birth"
    t.string "local_type"
    t.date "dlw"
    t.date "dli"
    t.date "first_contact"
    t.date "packet_sent"
    t.date "sign_up_date"
    t.date "initial_to_local"
    t.date "verfication_of_local"
    t.date "sixteen_ninety_six_to_oadr"
    t.date "verification_of_oadr"
    t.string "local"
    t.string "oadr"
    t.date "initial_appearance"
    t.date "initial_denial"
    t.date "recon_filed"
    t.date "recon_denial"
    t.date "fr_requested"
    t.date "fr_sub"
    t.date "rfh_filed"
    t.date "rfh_acked"
    t.date "proposed_exhibits"
    t.date "ready_to_schedule"
    t.date "date_scheduled"
    t.date "claimant_hearing_prep"
    t.date "notice_of_hearing"
    t.date "hearing_date"
    t.date "supplemental_date"
    t.date "expedited"
    t.string "decision"
    t.date "decision_date"
    t.string "alj"
    t.string "ve"
    t.string "me"
    t.date "ac"
    t.string "awarded_at"
    t.boolean "appeal"
    t.boolean "appeal_filed"
    t.date "close_out_letter"
    t.decimal "costs"
    t.decimal "cost_two"
    t.decimal "cost_three"
    t.date "date_costs_received"
    t.date "date_ssdi_received"
    t.date "date_ssi_received"
    t.string "case_id"
    t.string "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "letters", force: :cascade do |t|
    t.text "content"
    t.string "to"
    t.string "from"
    t.string "cc"
    t.string "bcc"
    t.boolean "template"
    t.boolean "email"
    t.datetime "sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "client_id"
    t.index ["client_id"], name: "index_letters_on_client_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
