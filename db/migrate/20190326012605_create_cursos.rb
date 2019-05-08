class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :sigla
      t.string :codigo
      t.string :curriculo

      t.timestamps
    end
  end
end
