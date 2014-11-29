class CanAnnounce < ActiveRecord::Migration
  def self.up
    add_column :users, :can_announce, :boolean, :default => false
  end

  def self.down
    remove_column :users, :can_announce
  end
end
