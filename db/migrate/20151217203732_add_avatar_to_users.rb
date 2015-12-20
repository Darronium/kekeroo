class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, default: "avatar"+rand(1..3).to_s
  end
end
