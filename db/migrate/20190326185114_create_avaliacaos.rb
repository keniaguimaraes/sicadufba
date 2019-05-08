class CreateAvaliacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliacaos do |t|
      t.integer :user_id
      t.integer :professor_id
      t.integer :itemavaliacao_id
      t.boolean :resp_positiva
      t.boolean :resp_negativa
      t.date    :data_avaliacao

      t.timestamps
    end
  end
end
