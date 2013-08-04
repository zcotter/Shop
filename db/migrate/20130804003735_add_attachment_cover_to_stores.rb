class AddAttachmentCoverToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :stores, :cover
  end
end
