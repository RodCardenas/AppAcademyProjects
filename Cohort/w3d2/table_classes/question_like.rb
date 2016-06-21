class QuestionLike < ModelBase


  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT users.id, fname, lname FROM question_likes JOIN users on users.id = user_id WHERE question_id = '#{question_id}'
    SQL

    results.map { |result| User.new(result) }
  end

  def self.num_likes_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT count(users.id) as ct FROM question_likes JOIN users on users.id = user_id WHERE question_id = '#{question_id}'
    SQL
    results[0]['ct']
  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT questions.id, title, body, author_id FROM question_likes JOIN questions ON question_id = questions.id WHERE user_id = '#{user_id}'
    SQL
    results.map { |result| Question.new(result) }
  end

  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT questions.id, title, body, author_id
      FROM question_likes
      JOIN questions on question_id = questions.id
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
    @question_id = input['question_id']
    @user_id = input['user_id']
  end
end
