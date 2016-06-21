require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @session ||= Session.new(@req)
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to (url)
    raise "Already rendered..." if @already_built_response
    @already_built_response = true
    @res.headers["Location"] = url
    @res.status = 302
    @session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Already rendered..." if @already_built_response
    @already_built_response = true
    @res.headers['Content-Type'] = content_type
    @res.body = [content]
    @session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    path = "views/" + parse_name + "/#{template_name}" + ".html.erb"
    template = File.read(path)

    erb = ERB.new(template).result(binding)
    render_content(erb, "text/html")
  end

  def parse_name
    n = self.class.name
    chs = []
    inserts = []

    n.chars.each_with_index do |c, idx|
      if ('A'..'Z').include?(c) && idx - 1 > 0
        inserts << idx
        chs[idx] = c.downcase
      else
        chs[idx] = c.downcase
      end
    end

    inserts.each do |i|
      chs.insert(i, '_')
    end

    chs.join("")
  end

  # method exposing a `Session` object
  def session
    @session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
