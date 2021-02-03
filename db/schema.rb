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

ActiveRecord::Schema.define(version: 2021_02_03_001515) do

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "endereco"
    t.string "estado_civil"
    t.integer "quant_filhos"
    t.text "historico_doencas"
    t.text "medicamentos"
    t.string "eh_fumante"
    t.string "ingere_alcool"
  end

  create_table "psicologos", force: :cascade do |t|
    t.string "crp"
    t.string "nome"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
