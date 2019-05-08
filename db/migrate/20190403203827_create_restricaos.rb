class CreateRestricaos < ActiveRecord::Migration[5.2]
  def change
    create_table :restricaos do |t|
      t.string :palavra

      t.timestamps
    end
  end
end
