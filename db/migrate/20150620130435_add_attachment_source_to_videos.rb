class AddAttachmentSourceToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :source
    end
  end

  def self.down
    remove_attachment :videos, :source
  end
end
