# == Schema Information
#
# Table name: todo_lists
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#

class TodoList < ActiveRecord::Base
  validates :user_id, :name, :description, presence: true

  belongs_to :user
  has_many :todo_items
end
