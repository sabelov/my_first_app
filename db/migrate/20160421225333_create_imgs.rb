class CreateImgs < ActiveRecord::Migration
  def change
    create_table :imgs do |t|
      t.integer :collection_id
      t.string :name
      t.timestamps null: false
    end
  end
end
