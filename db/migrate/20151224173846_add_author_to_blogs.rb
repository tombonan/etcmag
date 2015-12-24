class AddAuthorToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :author, index: true, foreign_key: true
  end
end
