# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string
#  website       :string
#  market_cap    :float
#  ticker_symbol :string
#  created_at    :datetime
#  updated_at    :datetime
#  exchange_id   :integer
#

# create_table "companies", force: true do |t|
#   t.string   "name"
#   t.string   "website"
#   t.float    "market_cap"
#   t.string   "ticker_symbol"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "exchange_id"
# end

class Company < ActiveRecord::Base
  belongs_to :exchange,
  foreign_key: :exchange_id,
  primary_key: :id,
  class_name: :Exchange

  has_many :prices,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Price

  has_many :watch_list_items,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :WatchListItem

  has_many :watch_lists,
  through: :watch_list_items,
  source: :watch_list

  has_one :board,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Board

  has_many :watchers,
  through: :watch_lists,
  source: :user

end
