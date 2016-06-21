class Poll < ActiveRecord::Base
  validates :author_id, :title, presence: true

  has_many :questions,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Question

  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses

end
