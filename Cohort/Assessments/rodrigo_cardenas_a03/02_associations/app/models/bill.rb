# == Schema Information
#
# Table name: bills
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Bill < ActiveRecord::Base
  belongs_to :author,
  foreign_key: :author_id,
  primary_key: :id,
  class_name: :Senator

  has_one :sponsoring_party,
  through: :author,
  source: :party

  # has_one :bill_endorsement,
  # foreign_key: :bill_id,
  # primary_key: :id,
  # class_name: :BillEndorsement
  #
  # has_many :endorsing_senators,
  # through: :bill_endorsement,
  # source: :senator

  def endorsing_senators
    p self
    b_id = self.id
    Senator.select('from senators join bill_endorsements on id = BillEndorsement.bill_id where :bill_endorsements => #{b_id}')
  end

end
