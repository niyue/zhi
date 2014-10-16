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

ActiveRecord::Schema.define(version: 20141016061444) do

  create_table "choices", force: true do |t|
    t.string   "description"
    t.boolean  "correct",            default: false
    t.integer  "multiple_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["multiple_choice_id"], name: "index_choices_on_multiple_choice_id"

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "essays", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  create_table "multiple_choices", force: true do |t|
    t.text     "description"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.integer  "exam_id"
    t.integer  "question_id"
    t.string   "question_type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["exam_id", "question_id", "question_type"], name: "index_parts_on_exam_id_and_question_id_and_question_type", unique: true
  add_index "parts", ["exam_id"], name: "index_parts_on_exam_id"
  add_index "parts", ["position"], name: "index_parts_on_position"

  create_table "questions", force: true do |t|
    t.integer  "exam_id"
    t.integer  "question_id"
    t.string   "question_type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id"

  create_table "short_answers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
