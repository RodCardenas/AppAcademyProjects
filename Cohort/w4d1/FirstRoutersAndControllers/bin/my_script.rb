require 'addressable/uri'
require 'rest-client'
#
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s
#
# puts RestClient.get(url)

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { users: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
    )
  rescue RestClient::Exception => e
    puts e.message
  end

end

create_user
