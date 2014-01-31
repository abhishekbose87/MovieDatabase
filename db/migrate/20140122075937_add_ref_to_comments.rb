class AddRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_reference :comments, :movie, index: true
  end
end
