class CreateDenunciacomentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :denunciacomentarios do |t|
      t.integer :usuario_id
      t.integer  :comentar_id
      t.timestamps
    end
  end
end
