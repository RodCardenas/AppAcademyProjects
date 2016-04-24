# == Schema Information
#
# Table name: senators
#
#  id         :integer          not null, primary key
#  fname      :string(255)
#  lname      :string(255)
#  state      :string(255)
#  party_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Senator < ActiveRecord::Base
  has_many :bill_endorsements,
  foreign_key: :senator_id,
  primary_key: :id,
  class_name: :BillEndorsement

  has_many :bills,
  foreign_key: :author_id,
  primary_key: :id,
  class_name: :Bills

  has_many :committee_memberships,
  foreign_key: :senator_id,
  primary_key: :id,
  class_name: :CommitteeMembership

  has_one :committee_chaired,
  foreign_key: :chairperson_id,
  primary_key: :id,
  class_name: :Committee

  has_one :desk,
  foreign_key: :owner_id,
  primary_key: :id,
  class_name: :Desk

  belongs_to :party,
  foreign_key: :party_id,
  primary_key: :id,
  class_name: :Party

  has_one :ideology,
  through: :party,
  source: :ideology

  has_one :party_leader,
  through: :party,
  source: :party_leader

  has_many :committees,
  through: :committee_memberships,
  source: :committee

  has_many :chairpersons,
  through: :committees,
  source: :chairperson

  has_one :party_led,
  through: :party_leader,
  source: :party
end
