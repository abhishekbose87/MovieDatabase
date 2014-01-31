class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :desc

      t.timestamps
    end
  end
end
