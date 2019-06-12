class CreateTipoperfils < ActiveRecord::Migration[5.2]
  def change
    create_table :tipoperfils do |t|
      t.string :perfil
      t.timestamps
    end
  end
end
