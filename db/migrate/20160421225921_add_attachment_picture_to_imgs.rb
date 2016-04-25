class AddAttachmentPictureToImgs < ActiveRecord::Migration
  def self.up
    change_table :imgs do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :imgs, :picture
  end
end
