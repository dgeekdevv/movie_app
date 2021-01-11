class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :genres
      t.integer :year
      t.string :director
      t.string :main_star
      t.text :description
      t.integer :favorites, default: 0
      t.timestamps
    end
  end
end
