class DropShortenedUrLs < ActiveRecord::Migration
  def change
    drop_table :shortened_ur_ls
  end
end
