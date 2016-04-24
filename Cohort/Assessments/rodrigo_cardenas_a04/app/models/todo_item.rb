# == Schema Information
#
# Table name: todo_items
#
#  id           :integer          not null, primary key
#  body         :string
#  completed    :boolean          default(FALSE)
#  todo_list_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TodoItem < ActiveRecord::Base
  validates :todo_list_id, presence: true
  belongs_to :todo_list
end
