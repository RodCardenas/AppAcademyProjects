# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  created_at :datetime
#  updated_at :datetime
#

# create_table "users", force: true do |t|
#   t.string   "username"
#   t.string   "password"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class User < ActiveRecord::Base
  has_many :watch_lists,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :WatchList

  has_many :watch_list_items,
  through: :watch_lists,
  source: :watch_list_items

  has_many :watched_companies,
  through: :watch_list_items,
  source: :company
end
