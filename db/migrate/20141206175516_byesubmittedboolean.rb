class Byesubmittedboolean < ActiveRecord::Migration
  def change
    remove_column :submissions, :submitted
  end
end
