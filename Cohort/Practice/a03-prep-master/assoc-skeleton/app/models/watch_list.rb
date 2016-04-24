# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

# create_table "watch_lists", force: true do |t|
#   t.string   "name"
#   t.integer  "user_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class WatchList < ActiveRecord::Base
  belongs_to :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :User

  has_many :watch_list_items,
  foreign_key: :watch_list_id,
  primary_key: :id,
  class_name: :WatchListItem
end
