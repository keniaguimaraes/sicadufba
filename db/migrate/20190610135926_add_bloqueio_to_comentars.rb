class AddBloqueioToComentars < ActiveRecord::Migration[5.2]
  def change
    add_column :comentars, :denuncia, :integer
    add_column :comentars, :bloqueio, :boolean
    add_column :comentars, :data_bloqueio, :datetime
  end
end
