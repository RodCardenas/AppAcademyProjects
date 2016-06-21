class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    # result = {}
    # answer_choices.includes(:responses).each do |choice|
    #   result[choice] = choice.responses.length
    # end
    # result

    query = Question.find_by_sql(<<-SQL)
        SELECT answer_choices.*, COUNT(responses.id) as response_ct
        FROM answer_choices
        JOIN responses on answer_choices.id = responses.answer_choice_id
        GROUP BY answer_choices.id
      SQL

    results = {}
    query.each do |el|
      results[el.text] = el.response_ct
    end

    results
  end
end
