class AddFieldsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :upvotes, :integer, default: 0
    add_column :movies, :downvotes, :integer, default: 0
  end
end
