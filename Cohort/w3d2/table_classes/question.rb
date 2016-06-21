class Question < ModelBase

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM questions WHERE author_id = '#{author_id}'
    SQL
    results.map {|result| Question.new(result) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_accessor :id, :title, :body, :author_id

  def initialize(input)
    @id = input['id']
    @title = input['title']
    @body = input['body']
    @author_id = input['author_id']
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end
