# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_26_124810) do
  create_table "pokemon_types", force: :cascade do |t|
    t.string "pokemon_name", null: false
    t.string "type_name", null: false
    t.index ["pokemon_name"], name: "index_pokemon_types_on_pokemon_name"
    t.index ["type_name"], name: "index_pokemon_types_on_type_name"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.integer "height"
    t.integer "weight"
    t.text "sprite"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "special_attack"
    t.integer "special_defense"
    t.integer "speed"
    t.integer "base_experience"
    t.index ["name"], name: "index_pokemons_on_name", unique: true
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_types_on_name", unique: true
  end

end
