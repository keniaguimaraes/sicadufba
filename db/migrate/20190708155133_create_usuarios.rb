class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.integer :user_id
      t.string  :username
      t.integer :tipoperfil_id
      t.integer :curso_id
      t.boolean :administrador, null: false, default:false 
      t.boolean :bloqueio, null: false, default:false 
      t.timestamps
    end
  end
end



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
