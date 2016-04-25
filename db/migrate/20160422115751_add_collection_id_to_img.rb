class AddCollectionIdToImg < ActiveRecord::Migration
  def change
    add_column :imgs, :collection_id, :integer
  end
end
