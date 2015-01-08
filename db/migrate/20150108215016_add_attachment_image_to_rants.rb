class AddAttachmentImageToRants < ActiveRecord::Migration
  def self.up
    change_table :rants do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rants, :image
  end
end
