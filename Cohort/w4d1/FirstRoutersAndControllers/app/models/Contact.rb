class Contact < ActiveRecord::Base
  validates :name, :email, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :contact_shares

  has_many :comments, as: :commentable

  has_many :shared_users,
  through: :contact_shares,
  source: :user
end
