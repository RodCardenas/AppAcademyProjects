
class QuestionFollow < ModelBase

  def self.followers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT users.id, fname, lname FROM questions_follows JOIN users on user_id = users.id WHERE question_id = '#{question_id}'
    SQL
    results.map { |result| User.new(result) }
  end

  def self.followed_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT questions.id, title, body, author_id FROM questions_follows JOIN questions on questions_follows.question_id = questions.id WHERE user_id = '#{user_id}'
    SQL
    results.map { |result| Question.new(result) }
  end

  def self.most_followed_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT questions.id, title, body, author_id
      FROM questions_follows
      JOIN questions on questions_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        count(user_id) DESC
      LIMIT
        '#{n}'
    SQL

    results.map { |result| Question.new(result) }
  end

  attr_accessor :id, :question_id, :user_id

  def initialize(input)
    @id = input['id']
    @user_id = input['user_id']
    @question_id = input['question_id']
  end
end
