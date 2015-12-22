class AddColorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :color_code, :string
  end
end
