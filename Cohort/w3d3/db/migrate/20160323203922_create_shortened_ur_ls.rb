class CreateShortenedUrLs < ActiveRecord::Migration
  def change
    create_table :shortened_ur_ls do |t|
      t.string :long_URL, null: false
      t.string :short_URL, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
