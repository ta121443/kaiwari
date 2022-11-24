class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.text :session_id, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.text :event, null: false

      t.timestamps
    end
  end
end
