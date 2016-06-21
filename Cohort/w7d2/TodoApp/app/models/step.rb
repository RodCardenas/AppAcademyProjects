class Step < ActiveRecord::Base
  validates :body, :todo, presence: true
  validates :done, inclusion: { in: [true, false] }

  belongs_to :todo
end
