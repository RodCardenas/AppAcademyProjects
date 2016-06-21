class Reply < ModelBase

  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM replies WHERE user_id = '#{user_id}'
    SQL
    results.map { |result| Reply.new(result) }
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM replies WHERE question_id = '#{question_id}'
    SQL
    results.map { |result| Reply.new(result) }
  end

  def self.find_children(id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM replies WHERE parent_id = '#{id}'
    SQL
    results.map { |result| Reply.new(result) }
  end


  attr_accessor :id, :question_id, :parent_id, :user_id, :body

  def initialize(input)
    @id = input['id']
    @question_id = input['question_id']
    @parent_id = input['parent_id']
    @user_id = input['user_id']
    @body = input['body']
  end


  def author
    User.find_by_id(@id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_id) unless @parent_id.nil?
  end

  def child_replies
    Reply.find_children(@id)
  end
end
