class AddLikesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :like, :integer
    add_column :posts, :dislike, :integer
  end
end
