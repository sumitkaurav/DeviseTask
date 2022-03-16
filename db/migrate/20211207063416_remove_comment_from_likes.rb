class RemoveCommentFromLikes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :comment, null: false, foreign_key: true
  end
end
