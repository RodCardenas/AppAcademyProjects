class XmlDocument
  attr_accessor :indent

  def initialize(indent = false)
    @indent = indent
    @levels = 0
  end

  def method_missing(name, *args, &block)
    options = args[0]
    result = ""

    if block_given?
      result = "#{indent}<#{name}>#{newline}#{yield}#{rev_indent}</#{name}>#{newline}"
    else
      if !options.nil?
        k = options.keys[0]
        result = "#{indent(false)}<#{name} #{k}=\"#{options[k]}\"/>#{newline}"
      else
        result = "<#{name}/>"
      end
    end

    result
  end

  def newline
    "#{@indent ? "\n" : ""}"
  end

  def indent(increase = true)
    total_indention =  "#{@indent ? "  " : ""}" * @levels
    @levels += increase ? 1 : 0
    total_indention
  end

  def rev_indent
    @levels -= 1
    total_indention =  "#{@indent ? "  " : ""}" * @levels
  end

end
