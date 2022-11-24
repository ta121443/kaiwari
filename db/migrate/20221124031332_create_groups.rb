class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.integer :session_id
      t.text :name

      t.timestamps
    end
    add_index :groups, :session_id
  end
end
