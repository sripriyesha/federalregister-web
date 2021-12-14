# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_08_193027) do

  create_table "clippings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "document_number"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "folder_id"
  end

  create_table "comment_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "token"
    t.string "attachment"
    t.string "attachment_md5"
    t.string "salt"
    t.string "iv"
    t.integer "file_size"
    t.string "content_type"
    t.string "original_file_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_comment_attachments_on_created_at"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "document_number"
    t.string "comment_tracking_number"
    t.datetime "created_at"
    t.boolean "comment_publication_notification"
    t.datetime "checked_comment_publication_at"
    t.string "salt"
    t.string "iv"
    t.binary "encrypted_comment_data"
    t.string "agency_name"
    t.boolean "agency_participating"
    t.string "comment_document_number"
    t.string "submission_key"
    t.index ["agency_participating"], name: "index_comments_on_agency_participating"
    t.index ["comment_publication_notification"], name: "index_comments_on_comment_publication_notification"
    t.index ["comment_tracking_number"], name: "index_comments_on_comment_tracking_number"
    t.index ["created_at"], name: "index_comments_on_created_at"
    t.index ["document_number"], name: "index_comments_on_document_number"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "entry_emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "remote_ip"
    t.integer "num_recipients"
    t.integer "entry_id"
    t.string "sender_hash"
    t.string "document_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "folders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mailing_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "parameters"
    t.string "title", limit: 1000
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.timestamp "deleted_at"
    t.index ["deleted_at"], name: "index_mailing_lists_on_deleted_at"
  end

  create_table "subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "mailing_list_id"
    t.string "requesting_ip"
    t.string "token"
    t.datetime "unsubscribed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_delivered_at"
    t.integer "delivery_count", default: 0, null: false
    t.date "last_issue_delivered"
    t.string "environment"
    t.integer "user_id"
    t.integer "comment_id"
    t.timestamp "deleted_at"
    t.string "last_documents_delivered_hash"
    t.index ["comment_id"], name: "index_subscriptions_on_comment_id"
    t.index ["deleted_at"], name: "index_subscriptions_on_deleted_at"
    t.index ["mailing_list_id", "deleted_at"], name: "index_subscriptions_on_mailing_list_id_and_deleted_at"
    t.index ["mailing_list_id", "last_documents_delivered_hash"], name: "mailing_list_documents"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", limit: 120, default: ""
    t.string "encrypted_password", limit: 128, default: "", null: false
    t.string "reset_password_token", limit: 20
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "new_clippings_count"
    t.string "confirmation_token", limit: 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
