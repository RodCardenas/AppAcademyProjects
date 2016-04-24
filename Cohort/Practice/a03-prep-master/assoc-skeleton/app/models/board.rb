# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

# create_table "boards", force: true do |t|
#   t.integer  "company_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class Board < ActiveRecord::Base
  belongs_to :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company

  has_many :memberships,
  foreign_key: :board_id,
  primary_key: :id,
  class_name: :BoardMembership

  has_many :members,
  through: :memberships,
  source: :member

  has_one :exchange,
  through: :company,
  source: :exchange


end
