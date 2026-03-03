class RenameCollumn < ActiveRecord::Migration[8.1]
  def change
    rename_column :follows, :follower_id, :followed_user
    rename_column :follows, :following_id, :follower_user
  end
end
