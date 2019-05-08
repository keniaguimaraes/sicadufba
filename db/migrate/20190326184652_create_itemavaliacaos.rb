class CreateItemavaliacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :itemavaliacaos do |t|
      t.string :item

      t.timestamps
    end
  end
end
