class CreateSemestres < ActiveRecord::Migration[5.2]
  def change
    create_table :semestres do |t|
      t.integer :ano
      t.integer :codigo

      t.timestamps
    end
  end
end
