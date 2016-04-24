# == Schema Information
#
# Table name: board_memberships
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  board_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# create_table "board_memberships", force: true do |t|
#   t.integer  "member_id"
#   t.integer  "board_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class BoardMembership < ActiveRecord::Base
  belongs_to :board,
  foreign_key: :board_id,
  primary_key: :id,
  class_name: :Board

  belongs_to :member,
  foreign_key: :member_id,
  primary_key: :id,
  class_name: :Executive

end
