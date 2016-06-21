class TagTopic < ActiveRecord::Migration
  def change
    create_table :tagtopics do |t|
      t.string :topic, null: false
      t.timestamps
    end

    create_table :taggings do |t|
      t.integer :tagtopic_id, null: false
      t.integer :url_id, null: false
      t.timestamps
    end
  end
end
