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

ActiveRecord::Schema.define(version: 20170731203923) do

  create_table "alignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "sequence"
    t.integer "flags"
    t.string "direction", limit: 1
    t.string "reference"
    t.string "chromosome"
    t.integer "position"
    t.string "cigar"
    t.integer "alignment_score"
    t.integer "length_eq"
    t.integer "length_all"
    t.float "percent_eq", limit: 24
    t.integer "edit_distance"
    t.float "percent_ed", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chromosome"], name: "index_alignments_on_chromosome"
    t.index ["percent_ed"], name: "index_alignments_on_percent_ed"
    t.index ["percent_eq"], name: "index_alignments_on_percent_eq"
    t.index ["position"], name: "index_alignments_on_position"
    t.index ["reference"], name: "index_alignments_on_reference"
    t.index ["sequence"], name: "index_alignments_on_sequence"
  end

end
