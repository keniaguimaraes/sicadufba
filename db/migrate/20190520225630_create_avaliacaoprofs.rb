class CreateAvaliacaoprofs < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliacaoprofs do |t|
      t.integer :user_id
      t.integer :professor_id
      t.integer :semestre_id
      t.datetime :data_avaliacao
      t.boolean :dominio_conteudo
      t.boolean :relacionamento_alunos
      t.boolean :possui_didatica
      t.integer :recomendaria_professor

      t.timestamps
    end
  end
end
