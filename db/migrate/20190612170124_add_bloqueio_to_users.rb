class AddBloqueioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bloqueio, :boolean, default:0
  end
end
