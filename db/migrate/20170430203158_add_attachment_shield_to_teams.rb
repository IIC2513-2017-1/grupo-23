class AddAttachmentShieldToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :shield
    end
  end

  def self.down
    remove_attachment :teams, :shield
  end
end
