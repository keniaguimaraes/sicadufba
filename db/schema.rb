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

ActiveRecord::Schema.define(version: 2019_04_17_011903) do

  create_table "avaliacaos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "professor_id"
    t.integer "itemavaliacao_id"
    t.boolean "resp_positiva"
    t.boolean "resp_negativa"
    t.date "data_avaliacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "disciplinacurso_id"
    t.integer "professor_id"
    t.integer "semestre_id"
    t.text "comentario"
    t.datetime "data_comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "codigo"
    t.string "curriculo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinacursos", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "disciplina_id"
    t.string "semestre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itemavaliacaos", force: :cascade do |t|
    t.string "item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restricaos", force: :cascade do |t|
    t.string "palavra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semestres", force: :cascade do |t|
    t.integer "ano"
    t.integer "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "curso_id", default: 0, null: false
    t.boolean "administrador", default: false, null: false
    t.integer "perfil"
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

end
