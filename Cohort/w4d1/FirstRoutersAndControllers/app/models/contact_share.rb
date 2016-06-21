class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true

  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :contact
end
