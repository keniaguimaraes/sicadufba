class AddOcultarToComentars < ActiveRecord::Migration[5.2]
  def change
    add_column :comentars, :oculta, :boolean, default:false
  end
end
