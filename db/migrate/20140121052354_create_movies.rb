class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.text :cast
      t.date :release_date
      t.string :language

      t.timestamps
    end
  end
end
