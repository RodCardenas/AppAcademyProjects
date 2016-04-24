# == Schema Information
#
# Table name: watch_list_items
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  start_date    :date
#  end_date      :date
#  watch_list_id :integer
#

# create_table "watch_list_items", force: true do |t|
#   t.integer  "company_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.date     "start_date"
#   t.date     "end_date"
#   t.integer  "watch_list_id"
# end

class WatchListItem < ActiveRecord::Base
  belongs_to :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company

  belongs_to :watch_list,
  foreign_key: :watch_list_id,
  primary_key: :id,
  class_name: :WatchList
end
