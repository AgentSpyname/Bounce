class AddAttachmentPictureToStatuses < ActiveRecord::Migration
  def self.up
    change_table :statuses do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :statuses, :picture
  end
end
