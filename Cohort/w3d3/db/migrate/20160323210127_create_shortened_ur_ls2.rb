class CreateShortenedUrLs2 < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :long_URL, null: false
      t.string :short_URL, null: false
      t.integer :submitter_id, null: false
      t.timestamps
    end
    add_index :shortened_urls, :submitter_id
    add_index :shortened_urls, :short_URL
  end
end
