class User < ModelBase


  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM users WHERE fname = '#{fname}' AND lname = '#{lname}'
    SQL

    User.new(results[0])
  end

  attr_accessor :id, :fname, :lname

  def initialize(input)
    @id = input['id']
    @fname = input['fname']
    @lname = input['lname']
  end


  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollowed.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    karma = 0
    authored_questions.each do |question|
      karma += question.num_likes
    end
    karma.to_f / authored_questions.length
  end
end
