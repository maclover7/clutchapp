class AddWorkAllowedToAssignments < ActiveRecord::Migration
  def self.up
    add_column :assignments, :work_allowed, :boolean, :default => false
  end

  def self.down
    remove_column :assignments, :work_allowed
  end
end
