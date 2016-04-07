class AddPhotographerToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :photographer, :string
  end
end
