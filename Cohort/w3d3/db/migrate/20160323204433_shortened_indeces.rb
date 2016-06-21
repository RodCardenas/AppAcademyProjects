class ShortenedIndeces < ActiveRecord::Migration
  def change
    add_index :shortened_ur_ls, :user_id
    add_index :shortened_ur_ls, :short_URL
  end
end
