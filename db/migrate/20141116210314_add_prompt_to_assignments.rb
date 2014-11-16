class AddPromptToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :prompt, :text
  end
end
