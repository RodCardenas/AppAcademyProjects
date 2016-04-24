# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  company_id :integer
#  open       :float
#  high       :float
#  low        :float
#  close      :float
#  price_date :date
#  created_at :datetime
#  updated_at :datetime
#

# create_table "prices", force: true do |t|
#   t.integer  "company_id"
#   t.float    "open"
#   t.float    "high"
#   t.float    "low"
#   t.float    "close"
#   t.date     "price_date"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class Price < ActiveRecord::Base
  belongs_to :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company
end
