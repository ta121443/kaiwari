class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.text :session_id
      t.text :name

      t.timestamps
    end
  end
end
