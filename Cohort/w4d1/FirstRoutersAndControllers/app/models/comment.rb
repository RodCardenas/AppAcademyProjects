class Comment < ActiveRecord::Base
  validates :receiver_id, :receiver_type, :body, null: false
  belongs_to :commentable, polymorphic: true

end
