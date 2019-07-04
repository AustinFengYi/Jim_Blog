class RenameAnniuncementModel < ActiveRecord::Migration[5.2]
  def change
    rename_table :announcements, :blogs
  end
end
