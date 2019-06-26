class AddDisciplinacursoToAvaliacaoprofs < ActiveRecord::Migration[5.2]
  def change
    add_column :avaliacaoprofs, :disciplinacurso_id, :integer
  end
end
