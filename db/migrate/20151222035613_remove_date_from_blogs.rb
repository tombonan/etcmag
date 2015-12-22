class RemoveDateFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :date, :string
  end
end
