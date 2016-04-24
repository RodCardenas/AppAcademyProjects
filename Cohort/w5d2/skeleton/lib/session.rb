require 'json'

class Session
  attr_reader :session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookies = req.cookies["_rails_lite_app"]

    @cookies ||= {}

    if !cookies.nil?
      JSON.parse(cookies).each do |k,v|
        @cookies[k] = v
      end
    end
  end

  def [](key)
    @cookies[key]
  end

  def []=(key, val)
    @cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    to_be_saved = {}
    to_be_saved[:path] = "/"
    to_be_saved[:value] = @cookies.to_json
    res.set_cookie("_rails_lite_app", to_be_saved)
  end
end
