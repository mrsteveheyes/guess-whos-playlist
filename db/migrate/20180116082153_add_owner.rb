class AddOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :owner, :string
  end
end
