class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :body
      t.boolean :submitted
      t.integer :assignment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
