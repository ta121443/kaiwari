class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :group, null: false, foreign_key: true
      t.text :session_id
      t.text :name

      t.timestamps
    end
  end
end
