class DropCommentings < ActiveRecord::Migration
  def change
    drop_table :commentings
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments, [:commentable_id, :commentable_type]
    remove_index :comments, name: :index_comments_on_post_id
  end
end
