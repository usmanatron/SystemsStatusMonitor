require 'net/http'
require 'uri'
require 'json'

server = "http://api.icndb.com"

SCHEDULER.every '24h', :first_in => 0 do |job|
  url = URI.parse("#{server}/jokes/random?limitTo=[nerdy]")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(Net::HTTP::Get.new(url.request_uri))

  # Convert to JSON and retrieve joke
  j = JSON[response.body]
  joke = j['value']['joke']

  send_event('motd', { message: "#{joke}" , origin: "auto" })
end
