class CreateAvaliacaoprofs < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliacaoprofs do |t|
      t.integer :user_id
      t.integer :professor_id
      t.integer :semestre_id
      t.datetime :data_avaliacao
      t.integer :dominio_conteudo
      t.integer :relacionamento_alunos
      t.integer :possui_didatica
      t.integer :recomendaria_professor

      t.timestamps
    end
  end
end
