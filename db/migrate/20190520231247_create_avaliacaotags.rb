class CreateAvaliacaotags < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliacaotags do |t|
      t.integer :avaliacaoprof_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
