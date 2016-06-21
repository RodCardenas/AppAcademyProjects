class ModelBase

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM '#{self.get_table}'")

    results.map { |result| self.new(result) }
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM '#{self.get_table}' WHERE id = '#{id}'
    SQL

    self.new(results[0])
  end

  def self.get_table
    case self.to_s
    when "User"
      table = "users"
    when "Question"
      table = 'questions'
    when "Reply"
      table = 'replies'
    when "QuestionLike"
      table = 'question_likes'
    when "QuestionFollow"
      table = 'questions_follows'
    end
  end

  def self.parse_options(options)
    str = ''
    options.each do |key, val|
      str += "#{key} = '#{val}' AND "
    end
    p str[0...-5]
  end

  def self.where(options)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT * FROM '#{self.get_table}' WHERE #{parse_options(options)}
    SQL
    results.map {|result| self.new(result)}
  end
  def save
    if self.id.nil?
      insert
    else
      update
    end
  end

  def insert
    p self
    QuestionsDatabase.instance.execute(<<-SQL, self.inst)
      INSERT INTO
        '#{self.class.get_table}' (#{column_headers})
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, self.inst)
      UPDATE
        '#{self.class.get_table}'
      SET
        #{add_question_marks}
      WHERE
        id = '#{@id}'
    SQL
  end

  def add_question_marks
    cols = column_headers
    p cols

    cols.gsub!(","," = ?,")

    cols += " = ?"
    p cols
  end

  def column_headers
    vars = self.instance_variables

    vars = vars.drop(1)

    vars = vars.map do |var|
      var[1..-1].to_s
    end

    vars.join(", ")
  end

  def inst
    vars = self.instance_variables

    vars = vars.drop(1)

    vars = vars.map do |var|
      eval('self.' + var.to_s[1..-1])
    end

  end

end
