require 'sqlite3'
require 'Singleton'
require_relative './table_classes/model_base'
require_relative './table_classes/user'
require_relative './table_classes/question'
require_relative './table_classes/reply'
require_relative './table_classes/question_like'
require_relative './table_classes/question_follow'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super ('questions.db')
    self.results_as_hash = true
    self.type_translation = true
  end
end
