class CreateResultados < ActiveRecord::Migration[5.2]
  def change
    create_table :resultados do |t|
      t.integer :tiporesultado_id
      t.datetime :data_apuracao
      t.datetime :data_abertura
      t.integer  :semestre_id
      t.integer  :qtd_disciplinas
      t.integer  :qtd_comentarios
      t.integer  :qtd_usuarios
      t.integer  :qtd_docentes
      t.integer  :qtd_avaliacoes
      t.integer  :qtd_boa_didatica
      t.integer  :qtd_docentes
      t.integer  :qtd_avaliacoes
      t.integer  :qtd_bom_relacionamento
      t.integer  :qtd_bom_dominio
      t.integer  :qtd_nivel_recomendacao
      t.timestamps
    end
  end
end
