class AddDescriptionToAllModels < ActiveRecord::Migration
  def change
    add_column :collections, :description, :text
    add_column :imgs, :description, :text
    add_column :links, :description, :text
  end
end
