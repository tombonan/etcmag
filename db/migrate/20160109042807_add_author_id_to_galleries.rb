class AddAuthorIdToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :author, index: true, foreign_key: true
  end
end
