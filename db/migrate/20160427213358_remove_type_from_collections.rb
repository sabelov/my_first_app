class RemoveTypeFromCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :type, :string
  end
end
