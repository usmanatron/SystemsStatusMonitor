require 'net/http'
require 'uri'
require 'json'
require 'htmlentities'

server = "http://api.icndb.com"
@@joke

SCHEDULER.every '24h', :first_in => 0 do |job|
  url = URI.parse("#{server}/jokes/random?limitTo=[nerdy]&firstName=Usman&lastName=Iqbal")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == 'https')
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(Net::HTTP::Get.new(url.request_uri))

  # Convert to JSON and save joke after HTML decoding
  response = JSON[response.body]
  @@joke = HTMLEntities.new.decode response['value']['joke']
end

SCHEDULER.every '10s', :first_in => 0 do |job|
  send_event('motd', { message: "#{@@joke}", origin: 'auto' })
end
