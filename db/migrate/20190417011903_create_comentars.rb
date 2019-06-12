class CreateComentars < ActiveRecord::Migration[5.2]
  def change
    create_table :comentars do |t|
      t.integer :user_id
      t.integer :disciplinacurso_id
      t.integer :professor_id
      t.integer :semestre_id
      t.text    :comentario
      t.datetime :data_comentario
      
      t.timestamps
    end
  end
end
