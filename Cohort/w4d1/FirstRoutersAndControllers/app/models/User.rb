class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy

  has_many :authored_comments,
  foreign_key: :author_id,
  primary_key: :id,
  class_name: :Comment

  has_many :comments, as: :commentable

  has_many :shared_contacts,
  through: :contact_shares,
  source: :contact


end
