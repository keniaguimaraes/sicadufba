class CreateConfigAvaliacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :config_avaliacaos do |t|
      t.datetime :data_inicio
      t.datetime :data_fim

      t.timestamps
    end
  end
end
