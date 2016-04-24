class RPNCalculator

  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    if @stack.empty? then
      raise "calculator is empty"
    else
      return @stack.pop
    end
  end

  def plus
    if @stack.empty? then
      raise "calculator is empty"
    else
      @stack << @stack.pop + @stack.pop
    end
  end

  def minus
    if @stack.empty? then
      raise "calculator is empty"
    else
      @stack << -@stack.pop + @stack.pop
    end
  end

  def times
    if @stack.empty? then
      raise "calculator is empty"
    else
      @stack << @stack.pop * @stack.pop
    end
  end

  def divide
    if @stack.empty? then
      raise "calculator is empty"
    else
      divider = @stack.pop
      numerator = @stack.pop
      @stack << numerator.to_f / divider.to_f
    end
  end

  def value
    @stack.last
  end

  def tokens (equation)
    equation_chars = equation.split(" ")
    tokenized_equation = []

    equation_chars.each do |char|
      tokenized_equation << case char
                            when  "*"
                              :*
                            when "+"
                              :+
                            when "-"
                              :-
                            when "/"
                              :/
                            else
                              char.to_f
                            end
    end

    tokenized_equation
  end

  def evaluate(equation)
    equation_tokenized = tokens(equation)

    equation_tokenized.each do |char|
      case char
      when  :*
        times
      when :+
        plus
      when :-
        minus
      when :/
        divide
      else
        @stack << char
      end
    end

    self.value
  end

# Returns the last value on the stack and clears the stack in case calculator is to be reused.
  def ready_for_next_calculation
    return @stack.pop
  end

#W2D3 work is below this point
  def valid_equation?(equation)
    operands = 0
    operators = 0

    equation_tokenized = tokens(equation)

    equation_tokenized.each do |char|
      case char
      when  :*, :+, :-, :/
        operators += 1
      else
        operands += 1
      end
    end

    if operands != operators + 1
      return false
    else
      return true
    end

  end

end

def interaction_handler(file = nil)
  file.nil? ? process_command_line_input : process_file_input(file)
end

def process_file_input(file)
  puts "\nProcessing file: #{ARGV[0]}"

  equations = []

  File.open(file).each do |line|
      equations << line.chomp
  end

  calculator = RPNCalculator.new

  equations.each do |equation|
    puts "#{equation} = #{calculator.evaluate(equation).to_i}"
  end

  puts "Completed processing file: #{ARGV[0]}"
end

def process_command_line_input
  puts "\nEnter equation, having each digit and operand followed by an ENTER. When you are ready to eavluate, ENTER on a blank line:"

  equation = ""
  begin
    char = gets.chomp
    equation << char
  end until char == ""

  calculator = RPNCalculator.new
  format_equation = add_spaces(equation)

  if calculator.valid_equation?(format_equation)
    puts "#{format_equation} = #{calculator.evaluate(format_equation).to_i}"
  else
    puts "Invalid equation. Not enough operators in equation:\n#{format_equation}"
  end

end

def add_spaces(str)
  str_arr = str.split("")
  modified_arr = []
  str_arr.each do |char|
    modified_arr << char
    modified_arr << " "
  end
  modified_arr.pop
  modified_arr.join("")
end

if __FILE__ == $PROGRAM_NAME
  interaction_handler ARGV[0]
end
