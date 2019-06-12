class AddBloqueioToComentars < ActiveRecord::Migration[5.2]
  def change
    add_column :comentars, :denuncia, :integer, default:0
    add_column :comentars, :bloqueio, :boolean, default:false
    add_column :comentars, :data_bloqueio, :datetime
  end
end
