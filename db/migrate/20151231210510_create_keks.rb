class CreateKeks < ActiveRecord::Migration
  def change
    create_table :keks do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    end
    add_index :keks, :user_id
    add_index :keks, :message_id
    add_index :keks, [:user_id, :message_id], unique: true
  end
end
