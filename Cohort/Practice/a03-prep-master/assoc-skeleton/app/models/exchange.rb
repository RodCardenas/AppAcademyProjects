# == Schema Information
#
# Table name: exchanges
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

# create_table "exchanges", force: true do |t|
#   t.string   "name"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class Exchange < ActiveRecord::Base
  has_many :companies,
  foreign_key: :exchange_id,
  primary_key: :id,
  class_name: :Company
end
