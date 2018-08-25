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

ActiveRecord::Schema.define(version: 20170215015037) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_choice_id"
    t.integer "survey_response_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_choice_id"], name: "index_answers_on_question_choice_id"
    t.index ["survey_response_id"], name: "index_answers_on_survey_response_id"
  end

  create_table "creative_qualities", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_choices", force: :cascade do |t|
    t.integer "question_id"
    t.integer "creative_quality_id"
    t.integer "score"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creative_quality_id"], name: "index_question_choices_on_creative_quality_id"
    t.index ["question_id"], name: "index_question_choices_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_responses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
