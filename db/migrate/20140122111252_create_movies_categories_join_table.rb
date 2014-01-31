class CreateMoviesCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_movies, id: false do |t|
      t.integer :movie_id
      t.integer :category_id
    end
  end
end
