class AddHabilitadoToSemestres < ActiveRecord::Migration[5.2]
  def change
    add_column :semestres, :habilitado, :boolean, default:true 

  end
end
