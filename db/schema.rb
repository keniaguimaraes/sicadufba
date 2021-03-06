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

ActiveRecord::Schema.define(version: 2019_11_06_135200) do

  create_table "avaliacaoprofs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "professor_id"
    t.integer "semestre_id"
    t.datetime "data_avaliacao"
    t.integer "dominio_conteudo"
    t.integer "relacionamento_alunos"
    t.integer "possui_didatica"
    t.integer "recomendaria_professor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "disciplinacurso_id"
  end

  create_table "avaliacaotags", force: :cascade do |t|
    t.integer "avaliacaoprof_id"
    t.integer "tag_id"
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
    t.integer "denuncia", default: 0
    t.boolean "bloqueio", default: false
    t.datetime "data_bloqueio"
    t.boolean "oculta", default: false
  end

  create_table "config_avaliacaos", force: :cascade do |t|
    t.datetime "data_inicio"
    t.datetime "data_fim"
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

  create_table "denunciacomentarios", force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "comentar_id"
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

  create_table "resultados", force: :cascade do |t|
    t.integer "tiporesultado_id"
    t.datetime "data_apuracao"
    t.datetime "data_abertura"
    t.integer "semestre_id"
    t.integer "qtd_disciplinas"
    t.integer "qtd_comentarios"
    t.integer "qtd_usuarios"
    t.integer "qtd_docentes"
    t.integer "qtd_avaliacoes"
    t.integer "qtd_boa_didatica"
    t.integer "qtd_bom_relacionamento"
    t.integer "qtd_bom_dominio"
    t.integer "qtd_nivel_recomendacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semestres", force: :cascade do |t|
    t.integer "ano"
    t.integer "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipoperfils", force: :cascade do |t|
    t.string "perfil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.boolean "administrador", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer "user_id"
    t.string "username"
    t.integer "tipoperfil_id"
    t.integer "curso_id"
    t.boolean "administrador", default: false, null: false
    t.boolean "bloqueio", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
