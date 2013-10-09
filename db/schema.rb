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

ActiveRecord::Schema.define(version: 20130930121645) do

  create_table "froms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "more_info"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.date     "date_issued"
    t.date     "payment_due"
    t.text     "description"
    t.text     "payment_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "subtotal"
    t.float    "total_vat"
    t.float    "total"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "lines", force: true do |t|
    t.string   "product_description"
    t.string   "unit"
    t.float    "unit_value"
    t.float    "quantity"
    t.integer  "vat_value"
    t.float    "line_total"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tos", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "more_info"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
