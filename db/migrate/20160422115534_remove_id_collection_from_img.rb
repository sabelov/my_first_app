class RemoveIdCollectionFromImg < ActiveRecord::Migration
  def change
    remove_column :imgs, :id_collection
  end
end
