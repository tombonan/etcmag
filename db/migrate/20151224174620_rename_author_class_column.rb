class RenameAuthorClassColumn < ActiveRecord::Migration
  def change
  	rename_column :authors, :class, :year
  end
end
