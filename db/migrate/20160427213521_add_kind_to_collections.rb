class AddKindToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :kind, :string
  end
end
