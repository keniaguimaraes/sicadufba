class CreateDisciplinacursos < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplinacursos do |t|
      t.integer :curso_id
      t.integer :disciplina_id
      t.string :semestre

      t.timestamps
    end
  end
end
