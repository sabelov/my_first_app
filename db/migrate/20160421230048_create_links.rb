class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :collection_id
      t.string :reference
      t.string :name 
      t.timestamps null: false
    end
  end
end
